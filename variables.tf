# Joinmastodon

variable "name" {
  description = "Name of the fastly service (defaults to hostname)."
  type        = string
  default     = ""
}

variable "hostname" {
  description = "Hostname the service points to."
  type        = string
}

variable "backend_name" {
  description = "Optional name for the backend."
  type        = string
  default     = ""
}

variable "ssl_hostname" {
  description = "Hostname to use for SSL verification (if different from 'hostname')."
  type        = string
  default     = ""
}

variable "backend_address" {
  description = "Address to use for connecting to the backend. Can be a hostname or an IP address."
  type        = string
}

variable "shield_region" {
  description = "Which Fastly shield region to use. Should correspond with the shield code."
  type        = string
}

variable "healthcheck_host" {
  description = "Host to ping for healthcheck. Defaults to hostname."
  type        = string
  default     = ""
}

variable "healthcheck_name" {
  description = "Optional name for the healthcheck."
  type        = string
  default     = ""
}

variable "healthcheck_path" {
  description = "URL to use when doing a healthcheck."
  type        = string
  default     = "/"
}

variable "healthcheck_method" {
  description = "HTTP method to use when doing a healthcheck."
  type        = string
  default     = "GET"

  validation {
    condition     = contains(["CONNECT", "DELETE", "GET", "HEAD", "OPTIONS", "POST", "PUT", "TRACE"], var.healthcheck_method)
    error_message = "Healthcheck method must be a valid HTTP method"
  }
}

variable "healthcheck_expected_response" {
  description = "Response to expect from a healthy endpoint."
  type        = number
  default     = 200
}


# API

variable "api_name" {
  description = "Name of the fastly service (defaults to hostname)."
  type        = string
  default     = ""
}

variable "api_hostname" {
  description = "Hostname the service points to."
  type        = string
  default     = ""
}

variable "api_backend_name" {
  description = "Optional name for the backend."
  type        = string
  default     = ""
}

variable "api_ssl_hostname" {
  description = "Hostname to use for SSL verification (if different from 'hostname')."
  type        = string
  default     = ""
}

variable "api_backend_address" {
  description = "Address to use for connecting to the backend. Can be a hostname or an IP address."
  type        = string
}

variable "api_backend_ca_cert" {
  description = "CA cert to use when connecting to the backend."
  type        = string
  sensitive   = true
}

variable "api_shield_region" {
  description = "Which Fastly shield region to use (if different than main shield region). Should correspond with the shield code."
  type        = string
  default     = ""
}

variable "api_healthcheck_host" {
  description = "Host to ping for healthcheck. Defaults to hostname."
  type        = string
  default     = ""
}

variable "api_healthcheck_name" {
  description = "Optional name for the healthcheck."
  type        = string
  default     = ""
}

variable "api_healthcheck_path" {
  description = "URL to use when doing a healthcheck."
  type        = string
  default     = "/"
}

variable "api_healthcheck_method" {
  description = "HTTP method to use when doing a healthcheck."
  type        = string
  default     = "GET"

  validation {
    condition     = contains(["CONNECT", "DELETE", "GET", "HEAD", "OPTIONS", "POST", "PUT", "TRACE"], var.api_healthcheck_method)
    error_message = "Healthcheck method must be a valid HTTP method"
  }
}

variable "api_healthcheck_expected_response" {
  description = "Response to expect from a healthy endpoint."
  type        = number
  default     = 200
}


# Proxy

variable "proxy_name" {
  description = "Name of the fastly service (defaults to hostname)."
  type        = string
  default     = ""
}

variable "proxy_hostname" {
  description = "Hostname the service points to."
  type        = string
  default     = ""
}

variable "proxy_backend_name" {
  description = "Optional name for the backend."
  type        = string
  default     = ""
}

variable "proxy_ssl_hostname" {
  description = "Hostname to use for SSL verification (if different from 'hostname')."
  type        = string
  default     = ""
}

variable "proxy_backend_address" {
  description = "Address to use for connecting to the backend. Can be a hostname or an IP address."
  type        = string
}

variable "proxy_shield_region" {
  description = "Which Fastly shield region to use (if different than main shield region). Should correspond with the shield code."
  type        = string
  default     = ""
}

variable "proxy_healthcheck_host" {
  description = "Host to ping for healthcheck. Defaults to hostname."
  type        = string
  default     = ""
}

variable "proxy_healthcheck_name" {
  description = "Optional name for the healthcheck."
  type        = string
  default     = ""
}

variable "proxy_healthcheck_path" {
  description = "URL to use when doing a healthcheck."
  type        = string
  default     = "/"
}

variable "proxy_healthcheck_method" {
  description = "HTTP method to use when doing a healthcheck."
  type        = string
  default     = "HEAD"

  validation {
    condition     = contains(["CONNECT", "DELETE", "GET", "HEAD", "OPTIONS", "POST", "PUT", "TRACE"], var.proxy_healthcheck_method)
    error_message = "Healthcheck method must be a valid HTTP method"
  }
}

variable "proxy_healthcheck_expected_response" {
  description = "Response to expect from a healthy endpoint."
  type        = number
  default     = 404
}