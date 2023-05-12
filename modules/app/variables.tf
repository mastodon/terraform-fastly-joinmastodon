variable "name" {
  description = "Name of the fastly service (defaults to hostname)."
  type        = string
}

variable "hostname" {
  description = "Hostname the service points to."
  type        = string
}

variable "backend_name" {
  description = "Optional name for the backend."
  type        = string
}

variable "ssl_hostname" {
  description = "Hostname to use for SSL verification (if different from 'hostname')."
  type        = string
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
}

variable "healthcheck_name" {
  description = "Optional name for the healthcheck."
  type        = string
}

variable "healthcheck_path" {
  description = "URL to use when doing a healthcheck."
  type        = string
}

variable "healthcheck_method" {
  description = "HTTP method to use when doing a healthcheck."
  type        = string
}

variable "healthcheck_expected_response" {
  description = "Response to expect from a healthy endpoint."
  type        = number
}

variable "force_tls_hsts" {
  description = "Force TLS and HTTP Strict Transport Security (HSTS) to ensure that every request is secure."
  type        = bool
}

variable "hsts_duration" {
  description = "Number of seconds for the client to remember only to use HTTPS."
  type        = number
}
