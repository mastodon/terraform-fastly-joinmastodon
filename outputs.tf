output "id" {
  description = "The ID of this resource."
  value       = module.app.id
}

output "active_version" {
  description = "The currently active version of the Fastly Service."
  value       = module.app.active_version
}

output "cloned_version" {
  description = "The latest cloned version by the provider."
  value       = module.app.cloned_version
}

output "api_id" {
  description = "The ID of this resource."
  value       = module.api.id
}

output "api_active_version" {
  description = "The currently active version of the Fastly Service."
  value       = module.api.active_version
}

output "api_cloned_version" {
  description = "The latest cloned version by the provider."
  value       = module.api.cloned_version
}

output "proxy_id" {
  description = "The ID of this resource."
  value       = module.proxy.id
}

output "proxy_active_version" {
  description = "The currently active version of the Fastly Service."
  value       = module.proxy.active_version
}

output "proxy_cloned_version" {
  description = "The latest cloned version by the provider."
  value       = module.proxy.cloned_version
}
