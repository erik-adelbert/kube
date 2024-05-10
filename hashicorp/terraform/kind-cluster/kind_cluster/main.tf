module "create" {
  source = "./create"
}

provider "kubectl" {
  host = module.create.kind_cluster_endpoint

  cluster_ca_certificate = module.create.kind_cluster_cluster_ca_certificate
  client_certificate     = module.create.kind_cluster_client_certificate
  client_key             = module.create.kind_cluster_client_key

  load_config_file = false
}

data "kubectl_file_documents" "metrics_server" {
  content = file("./manifests/${var.metrics_server_manifest}")
}

resource "kubectl_manifest" "metrics_server" {
  for_each  = data.kubectl_file_documents.metrics_server.manifests
  yaml_body = each.value
}
