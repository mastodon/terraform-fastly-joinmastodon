output "id" {
  value = fastly_service_vcl.app_service.id
}

output "active_version" {
  value = fastly_service_vcl.app_service.active_version
}

output "cloned_version" {
  value = fastly_service_vcl.app_service.cloned_version
}
