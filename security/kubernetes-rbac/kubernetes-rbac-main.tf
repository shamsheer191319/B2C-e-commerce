resource "kubernetes_role" "app_reader" {
  metadata {
    name      = "app-reader"
    namespace = "default"
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services"]
    verbs      = ["get", "list"]
  }
}

resource "kubernetes_role_binding" "app_reader_binding" {
  metadata {
    name      = "app-reader-binding"
    namespace = "default"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.app_reader.metadata[0].name
  }

  subject {
    kind      = "User"
    name      = "ecommerce-dev-user"
    api_group = "rbac.authorization.k8s.io"
  }
}
