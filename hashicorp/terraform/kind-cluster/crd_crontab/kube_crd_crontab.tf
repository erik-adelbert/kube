resource "kubernetes_manifest" "crd_crontab" {
  depends_on = [kind_cluster.default]

  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind"       = "CustomResourceDefinition"
    "metadata" = {
      "name" = "crontabs.stable.example.com"
    }
    "spec" = {
      "group" = "stable.example.com"
      "scope" = "Namespaced"
      "names" = {
        "kind"     = "CronTab"
        "plural"   = "crontabs"
        "singular" = "crontab"
        "shortNames" = [
          "ct",
        ]
      }
      "versions" = [
        {
          "name"    = "v1"
          "served"  = "true"
          "storage" = "true"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "properties" = {
                    "cronSpec" = {
                      "type" = "string"
                    }
                    "image" = {
                      "type" = "string"
                    }
                    "replicas" = {
                      "type" = "integer"
                    }
                  }
                  "type" = "object"
                }
              }
              "type" = "object"
            }
          }
          "additionalPrinterColumns" = [
            {
              "name"        = "Spec"
              "type"        = "string"
              "description" = "The cron spec defining the interval a CronTab is run"
              "jsonPath"    = ".spec.cronSpec"
            },
            {
              "name"        = "Replicas"
              "type"        = "integer"
              "description" = "The number of jobs launched by the CronTab"
              "jsonPath"    = ".spec.replicas"
            },
            {
              "name"     = "Age"
              "type"     = "date"
              "jsonPath" = ".metadata.creationTimestamp"
            },
          ]
        },
      ]
    }
  }
}
