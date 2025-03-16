resource "gremlin_attack" "terminate_pod" {
  name  = "Terminate a random Kubernetes pod"
  type  = "container"
  scope = "random"

  container {
    target_type = "pod"
    impact_type = "shutdown"
    cluster_id  = var.cluster_id
  }
}

resource "gremlin_attack" "network_latency" {
  name  = "Simulate Network Latency"
  type  = "latency"
  scope = "random"

  network {
    delay   = "1000ms"
    jitter  = "500ms"
    target  = "service"
    cluster = var.cluster_id
  }
}
