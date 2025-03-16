resource "helm_release" "ecommerce" {
  name       = "ecommerce-app"
  chart      = "./helm"
  namespace  = "default"

  set {
    name  = "image.repository"
    value = "my-docker-repo/ecommerce"
  }

  set {
    name  = "image.tag"
    value = "latest"
  }
}
