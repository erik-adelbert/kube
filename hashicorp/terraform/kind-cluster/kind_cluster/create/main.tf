# Create a kind cluster of the name "test-cluster" with default kubernete version specified in kind
# https://github.com/kubernetes-sigs/kind/blob/master/pkg/apis/config/defaults/image.go#L21
# https://registry.terraform.io/providers/tehcyx/kind/latest/docs/resources/cluster

resource "kind_cluster" "default" {
  name       = var.kind_cluster_name
  node_image = "kindest/node:v${var.kind_cluster_kubernetes_semver}"
  #   lifecycle {
  #     prevent_destroy = true
  #   }
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]


      # https://kind.sigs.k8s.io/docs/user/ingress/#ingress-nginx
      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }
      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }

    node {
      role = "worker"
    }
  }
}
