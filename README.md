# Mastodon Terraform - Fastly Service for Joinmastodon

Terraform module for creating all necessary services in Fastly for hosting the [joinmastodon.org](joinmastodon.org) launch page.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_fastly"></a> [fastly](#requirement\_fastly) | >= 4.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api"></a> [api](#module\_api) | ./modules/api | n/a |
| <a name="module_app"></a> [app](#module\_app) | ./modules/app | n/a |
| <a name="module_proxy"></a> [proxy](#module\_proxy) | ./modules/proxy | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_backend_address"></a> [api\_backend\_address](#input\_api\_backend\_address) | Address to use for connecting to the backend. Can be a hostname or an IP address. | `string` | n/a | yes |
| <a name="input_api_backend_ca_cert"></a> [api\_backend\_ca\_cert](#input\_api\_backend\_ca\_cert) | CA cert to use when connecting to the backend. | `string` | n/a | yes |
| <a name="input_api_backend_name"></a> [api\_backend\_name](#input\_api\_backend\_name) | Optional name for the backend. | `string` | `""` | no |
| <a name="input_api_healthcheck_expected_response"></a> [api\_healthcheck\_expected\_response](#input\_api\_healthcheck\_expected\_response) | Response to expect from a healthy endpoint. | `number` | `200` | no |
| <a name="input_api_healthcheck_host"></a> [api\_healthcheck\_host](#input\_api\_healthcheck\_host) | Host to ping for healthcheck. Defaults to hostname. | `string` | `""` | no |
| <a name="input_api_healthcheck_method"></a> [api\_healthcheck\_method](#input\_api\_healthcheck\_method) | HTTP method to use when doing a healthcheck. | `string` | `"GET"` | no |
| <a name="input_api_healthcheck_name"></a> [api\_healthcheck\_name](#input\_api\_healthcheck\_name) | Optional name for the healthcheck. | `string` | `""` | no |
| <a name="input_api_healthcheck_path"></a> [api\_healthcheck\_path](#input\_api\_healthcheck\_path) | URL to use when doing a healthcheck. | `string` | `"/"` | no |
| <a name="input_api_hostname"></a> [api\_hostname](#input\_api\_hostname) | Hostname the service points to. | `string` | `""` | no |
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | Name of the fastly service (defaults to hostname). | `string` | `""` | no |
| <a name="input_api_shield_region"></a> [api\_shield\_region](#input\_api\_shield\_region) | Which Fastly shield region to use (if different than main shield region). Should correspond with the shield code. | `string` | `""` | no |
| <a name="input_api_ssl_hostname"></a> [api\_ssl\_hostname](#input\_api\_ssl\_hostname) | Hostname to use for SSL verification (if different from 'hostname'). | `string` | `""` | no |
| <a name="input_backend_address"></a> [backend\_address](#input\_backend\_address) | Address to use for connecting to the backend. Can be a hostname or an IP address. | `string` | n/a | yes |
| <a name="input_backend_name"></a> [backend\_name](#input\_backend\_name) | Optional name for the backend. | `string` | `""` | no |
| <a name="input_healthcheck_expected_response"></a> [healthcheck\_expected\_response](#input\_healthcheck\_expected\_response) | Response to expect from a healthy endpoint. | `number` | `200` | no |
| <a name="input_healthcheck_host"></a> [healthcheck\_host](#input\_healthcheck\_host) | Host to ping for healthcheck. Defaults to hostname. | `string` | `""` | no |
| <a name="input_healthcheck_method"></a> [healthcheck\_method](#input\_healthcheck\_method) | HTTP method to use when doing a healthcheck. | `string` | `"GET"` | no |
| <a name="input_healthcheck_name"></a> [healthcheck\_name](#input\_healthcheck\_name) | Optional name for the healthcheck. | `string` | `""` | no |
| <a name="input_healthcheck_path"></a> [healthcheck\_path](#input\_healthcheck\_path) | URL to use when doing a healthcheck. | `string` | `"/"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname the service points to. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the fastly service (defaults to hostname). | `string` | `""` | no |
| <a name="input_proxy_backend_address"></a> [proxy\_backend\_address](#input\_proxy\_backend\_address) | Address to use for connecting to the backend. Can be a hostname or an IP address. | `string` | n/a | yes |
| <a name="input_proxy_backend_name"></a> [proxy\_backend\_name](#input\_proxy\_backend\_name) | Optional name for the backend. | `string` | `""` | no |
| <a name="input_proxy_healthcheck_expected_response"></a> [proxy\_healthcheck\_expected\_response](#input\_proxy\_healthcheck\_expected\_response) | Response to expect from a healthy endpoint. | `number` | `404` | no |
| <a name="input_proxy_healthcheck_host"></a> [proxy\_healthcheck\_host](#input\_proxy\_healthcheck\_host) | Host to ping for healthcheck. Defaults to hostname. | `string` | `""` | no |
| <a name="input_proxy_healthcheck_method"></a> [proxy\_healthcheck\_method](#input\_proxy\_healthcheck\_method) | HTTP method to use when doing a healthcheck. | `string` | `"HEAD"` | no |
| <a name="input_proxy_healthcheck_name"></a> [proxy\_healthcheck\_name](#input\_proxy\_healthcheck\_name) | Optional name for the healthcheck. | `string` | `""` | no |
| <a name="input_proxy_healthcheck_path"></a> [proxy\_healthcheck\_path](#input\_proxy\_healthcheck\_path) | URL to use when doing a healthcheck. | `string` | `"/"` | no |
| <a name="input_proxy_hostname"></a> [proxy\_hostname](#input\_proxy\_hostname) | Hostname the service points to. | `string` | `""` | no |
| <a name="input_proxy_name"></a> [proxy\_name](#input\_proxy\_name) | Name of the fastly service (defaults to hostname). | `string` | `""` | no |
| <a name="input_proxy_shield_region"></a> [proxy\_shield\_region](#input\_proxy\_shield\_region) | Which Fastly shield region to use (if different than main shield region). Should correspond with the shield code. | `string` | `""` | no |
| <a name="input_proxy_ssl_hostname"></a> [proxy\_ssl\_hostname](#input\_proxy\_ssl\_hostname) | Hostname to use for SSL verification (if different from 'hostname'). | `string` | `""` | no |
| <a name="input_shield_region"></a> [shield\_region](#input\_shield\_region) | Which Fastly shield region to use. Should correspond with the shield code. | `string` | n/a | yes |
| <a name="input_ssl_hostname"></a> [ssl\_hostname](#input\_ssl\_hostname) | Hostname to use for SSL verification (if different from 'hostname'). | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_active_version"></a> [active\_version](#output\_active\_version) | The currently active version of the Fastly Service. |
| <a name="output_api_active_version"></a> [api\_active\_version](#output\_api\_active\_version) | The currently active version of the Fastly Service. |
| <a name="output_api_cloned_version"></a> [api\_cloned\_version](#output\_api\_cloned\_version) | The latest cloned version by the provider. |
| <a name="output_api_id"></a> [api\_id](#output\_api\_id) | The ID of this resource. |
| <a name="output_cloned_version"></a> [cloned\_version](#output\_cloned\_version) | The latest cloned version by the provider. |
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource. |
| <a name="output_proxy_active_version"></a> [proxy\_active\_version](#output\_proxy\_active\_version) | The currently active version of the Fastly Service. |
| <a name="output_proxy_cloned_version"></a> [proxy\_cloned\_version](#output\_proxy\_cloned\_version) | The latest cloned version by the provider. |
| <a name="output_proxy_id"></a> [proxy\_id](#output\_proxy\_id) | The ID of this resource. |
