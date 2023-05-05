output "id" {
  value = fastly_service_vcl.proxy_service.id
}

output "active_version" {
  value = fastly_service_vcl.proxy_service.active_version
}

output "cloned_version" {
  value = fastly_service_vcl.proxy_service.cloned_version
}
