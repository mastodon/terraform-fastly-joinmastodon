locals {
  api_hostname   = var.api_hostname != "" ? var.api_hostname : "api.${var.hostname}"
  proxy_hostname = var.proxy_hostname != "" ? var.proxy_hostname : "proxy.${var.hostname}"

  api_shield_region   = var.api_shield_region != "" ? var.api_shield_region : var.shield_region
  proxy_shield_region = var.proxy_shield_region != "" ? var.proxy_shield_region : var.shield_region
}

module "app" {
  source = "./modules/app"

  name                          = var.name
  hostname                      = var.hostname
  default_ttl                   = var.default_ttl
  backend_name                  = var.backend_name
  ssl_hostname                  = var.ssl_hostname
  backend_address               = var.backend_address
  backend_port                  = var.backend_port
  shield_region                 = var.shield_region
  healthcheck_host              = var.healthcheck_host
  healthcheck_name              = var.healthcheck_name
  healthcheck_path              = var.healthcheck_path
  healthcheck_method            = var.healthcheck_method
  healthcheck_expected_response = var.healthcheck_expected_response
  force_tls_hsts                = var.force_tls_hsts
  hsts_duration                 = var.hsts_duration
  gzip_default_policy           = var.gzip_default_policy
  product_enablement            = var.product_enablement
}

module "api" {
  source = "./modules/api"

  name                          = var.api_name
  hostname                      = local.api_hostname
  default_ttl                   = var.api_default_ttl
  backend_name                  = var.api_backend_name
  ssl_hostname                  = var.api_ssl_hostname
  backend_address               = var.api_backend_address
  backend_port                  = var.api_backend_port
  backend_ca_cert               = var.api_backend_ca_cert
  shield_region                 = local.api_shield_region
  healthcheck_host              = var.api_healthcheck_host
  healthcheck_name              = var.api_healthcheck_name
  healthcheck_path              = var.api_healthcheck_path
  healthcheck_method            = var.api_healthcheck_method
  healthcheck_expected_response = var.api_healthcheck_expected_response
  force_tls_hsts                = var.api_force_tls_hsts
  hsts_duration                 = var.api_hsts_duration
}

module "proxy" {
  source = "./modules/proxy"

  name                          = var.proxy_name
  hostname                      = local.proxy_hostname
  default_ttl                   = var.proxy_default_ttl
  backend_name                  = var.proxy_backend_name
  ssl_hostname                  = var.proxy_ssl_hostname
  backend_address               = var.proxy_backend_address
  backend_port                  = var.backend_port
  shield_region                 = local.proxy_shield_region
  healthcheck_host              = var.proxy_healthcheck_host
  healthcheck_name              = var.proxy_healthcheck_name
  healthcheck_path              = var.proxy_healthcheck_path
  healthcheck_method            = var.proxy_healthcheck_method
  healthcheck_expected_response = var.proxy_healthcheck_expected_response
  force_tls_hsts                = var.proxy_force_tls_hsts
  hsts_duration                 = var.proxy_hsts_duration
}
