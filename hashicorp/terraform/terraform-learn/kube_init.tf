variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

provider "kubernetes" {
  host = var.host

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

# provider "kubernetes" {
#   host = var.host

#   client_certificate     = base64decode(kind_cluster.default.client_certificate)
#   client_key             = base64decode(kind_cluster.default.client_key)
#   cluster_ca_certificate = base64decode(kind_cluster.default.cluster_ca_certificate)
# }
