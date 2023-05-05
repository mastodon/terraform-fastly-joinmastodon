locals {
  name = var.name != "" ? var.name : var.hostname

  hostname_parts   = split(".", var.hostname)
  backend_name     = var.backend_name != "" ? var.backend_name : "${var.hostname} - backend"
  ssl_hostname     = var.ssl_hostname != "" ? var.ssl_hostname : var.hostname
  healthcheck_host = var.healthcheck_host != "" ? var.healthcheck_host : var.hostname
  healthcheck_name = var.healthcheck_name != "" ? var.healthcheck_name : "${var.hostname} - healthcheck"

  vcl_apex_error            = templatefile("${path.module}/vcl/apex_error.vcl", { hostname = var.hostname })
  vcl_apex_redirect         = templatefile("${path.module}/vcl/apex_redirect.vcl", { hostname = "www.${var.hostname}" })
  vcl_apex_redirect_com     = templatefile("${path.module}/vcl/apex_redirect.vcl", { hostname = "${local.hostname_parts[0]}.com" })
  vcl_apex_redirect_www_com = templatefile("${path.module}/vcl/apex_redirect.vcl", { hostname = "www.${local.hostname_parts[0]}.com" })
}

resource "fastly_service_vcl" "app_service" {
  name = local.name

  default_ttl    = 300
  http3          = true
  stale_if_error = true

  # Need both default and www domains
  domain {
    name    = var.hostname
  }
  domain {
    name    = "www.${var.hostname}"
    comment = "Will be redirected to the APEX domain"
  }

  # If the domain is not a .com, make sure we add redirects for .com
  dynamic "domain" {
    for_each = substr(var.hostname, -4, 0) != ".com" ? ["${local.hostname_parts[0]}.com", "www.${local.hostname_parts[0]}.com"] : []
    content {
      name    = domain.value
      comment = "Will be redirected to the APEX domain"
    }
  }

  # Backend
  backend {
    name    = local.backend_name
    address = var.backend_address

    auto_loadbalance  = false
    healthcheck       = local.healthcheck_name
    keepalive_time    = 0
    override_host     = var.ssl_hostname
    port              = 443
    max_conn          = 200
    shield            = var.shield_region
    ssl_cert_hostname = local.ssl_hostname
    ssl_sni_hostname  = local.ssl_hostname
    use_ssl           = true
  }

  # Healthcheck
  healthcheck {
    name = local.healthcheck_name
    host = local.healthcheck_host
    path = var.healthcheck_path

    check_interval    = 60000
    expected_response = var.healthcheck_expected_response
    initial           = 1
    method            = var.healthcheck_method
    threshold         = 1
    timeout           = 5000
    window            = 2
  }

  # Force TLS/HSTS settings
  # Creates similar objects to what the GUI switch creates.

  request_setting {
    name = "Generated by force TLS and enable HSTS"

    bypass_busy_wait = false
    force_miss       = false
    force_ssl        = true
    max_stale_age    = 0
    timer_support    = false
    xff              = ""
  }

  header {
    action      = "set"
    destination = "http.Strict-Transport-Security"
    name        = "Generated by force TLS and enable HSTS"
    type        = "response"

    ignore_if_set = false
    priority      = 100
    source        = "\"max-age=300\""
  }

  # Custom VCL snippets

  snippet {
    name     = "Redirect to APEX - error"
    content  = local.vcl_apex_error
    type     = "error"
    priority = 100
  }

  snippet {
    content  = local.vcl_apex_redirect
    name     = "Redirect www to Apex - recv"
    priority = 100
    type     = "recv"
  }

  snippet {
    content  = local.vcl_apex_redirect_com
    name     = "Redirect com to org - recv"
    priority = 100
    type     = "recv"
  }

  snippet {
    content  = local.vcl_apex_redirect_www_com
    name     = "Redirect www com to org - recv"
    priority = 100
    type     = "recv"
  }
}
