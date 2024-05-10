resource "kubernetes_manifest" "my_awesome_custom_crontab" {
  depends_on = [kubernetes_manifest.crd_crontab]

  manifest = {
    "apiVersion" = "stable.example.com/v1"
    "kind"       = "CronTab"
    "metadata" = {
      "name"      = "my-awesome-cron-object"
      "namespace" = "default"
    }
    "spec" = {
      "cronSpec" = "* * * * */5"
      "image"    = "my-awesome-cron-image"
      "replicas" = 2
    }
  }
}
