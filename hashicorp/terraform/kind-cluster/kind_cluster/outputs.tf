
output "kind_cluster_endpoint" {
  value = module.create.kind_cluster_endpoint
}

output "kind_cluster_cluster_ca_certificate" {
  value = module.create.kind_cluster_cluster_ca_certificate
}

output "kind_cluster_client_certificate" {
  value = module.create.kind_cluster_client_certificate
}

output "kind_cluster_client_key" {
  value     = module.create.kind_cluster_client_key
  sensitive = true
}

