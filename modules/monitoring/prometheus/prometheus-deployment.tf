resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"

  set {
    name  = "server.persistentVolume.enabled"
    value = "true"
  }

  set {
    name  = "server.global.scrape_interval"
    value = "15s"
  }

  set {
    name  = "alertmanager.persistentVolume.enabled"
    value = "true"
  }
}
