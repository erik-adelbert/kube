terraform {
  required_version = ">= 1.8.0"

  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.0.4"
    }
  }
}



# provider "kubernetes" {
#   host = local.cluster.endpoint

#   client_certificate     = local.cluster.client_certificate
#   client_key             = local.cluster.client_key
#   cluster_ca_certificate = local.cluster.cluster_ca_certificate
# }


