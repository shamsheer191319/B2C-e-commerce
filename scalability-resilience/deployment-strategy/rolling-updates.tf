resource "kubernetes_deployment" "ecommerce_app" {
  metadata {
    name = var.app_name
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = var.replica_count

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.app_name
          image = var.container_image

          resources {
            requests = {
              cpu    = var.cpu_request
              memory = var.memory_request
            }
            limits = {
              cpu    = var.cpu_limit
              memory = var.memory_limit
            }
          }
        }
      }
    }

    # ✅ Corrected strategy block placement
    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge       = var.max_surge
        max_unavailable = var.max_unavailable
      }
    }
  }
}
