output "id" {
  value = fastly_service_vcl.api_service.id
}

output "active_version" {
  value = fastly_service_vcl.api_service.active_version
}

output "cloned_version" {
  value = fastly_service_vcl.api_service.cloned_version
}
