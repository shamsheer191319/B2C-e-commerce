resource "helm_release" "datadog" {
  name       = "datadog"
  namespace  = "monitoring"
  repository = "https://helm.datadoghq.com"
  chart      = "datadog"

  set {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }
}
