locals {
  name = var.name != "" ? var.name : var.hostname

  backend_name     = var.backend_name != "" ? var.backend_name : "${var.hostname} - backend"
  ssl_hostname     = var.ssl_hostname != "" ? var.ssl_hostname : var.hostname
  healthcheck_host = var.healthcheck_host != "" ? var.healthcheck_host : var.hostname
  healthcheck_name = var.healthcheck_name != "" ? var.healthcheck_name : "${var.hostname} - healthcheck"

  datadog_format         = replace(file("${path.root}/logging/datadog.json"), "__service__", var.datadog_service)
}

resource "fastly_service_vcl" "api_service" {
  name = local.name

  default_ttl    = var.default_ttl
  http3          = true
  stale_if_error = true

  # Domain
  domain {
    name = var.hostname
  }

  # Backend
  backend {
    name    = local.backend_name
    address = var.backend_address

    auto_loadbalance  = false
    healthcheck       = local.healthcheck_name
    keepalive_time    = 0
    override_host     = local.ssl_hostname
    port              = var.backend_port
    max_conn          = 200
    shield            = var.shield_region
    ssl_ca_cert       = var.backend_ca_cert
    ssl_check_cert    = false
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

  # Datadog logging
  dynamic "logging_datadog" {
    for_each = var.datadog ? [1] : []
    content {
      name   = "Datadog ${var.datadog_region}"
      format = local.datadog_format
      token  = var.datadog_token

      region = var.datadog_region
    }
  }

  # Force TLS/HSTS settings
  # Creates similar objects to what the GUI switch creates.

  dynamic "request_setting" {
    for_each = var.force_tls_hsts ? [1] : []
    content {
      name = "Generated by force TLS and enable HSTS"

      bypass_busy_wait = false
      force_miss       = false
      force_ssl        = true
      max_stale_age    = 0
      timer_support    = false
      xff              = ""
    }
  }

  dynamic "header" {
    for_each = var.force_tls_hsts ? [1] : []
    content {
      action      = "set"
      destination = "http.Strict-Transport-Security"
      name        = "Generated by force TLS and enable HSTS"
      type        = "response"

      ignore_if_set = false
      priority      = 100
      source        = "\"max-age=${var.hsts_duration}\""
    }
  }

  # Allow CORS origin header
  header {
    action      = "set"
    destination = "http.Access-Control-Allow-Origin"
    name        = "Allow all CORS origins"
    type        = "cache"

    ignore_if_set = false
    priority      = 10
    source        = "\"*\""
  }
}
