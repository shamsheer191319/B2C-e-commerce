resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = "monitoring"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"

  set {
    name  = "adminPassword"
    value = "SecurePass123"
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}
