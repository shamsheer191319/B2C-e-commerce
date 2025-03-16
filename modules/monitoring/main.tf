provider "aws" {
  region = var.aws_region
}

# IAM Role for Prometheus and Grafana
resource "aws_iam_role" "monitoring" {
  name = "eks-monitoring-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Create Prometheus on EKS
resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"

  set {
    name  = "server.persistentVolume.enabled"
    value = "true"
  }
}

# Create Grafana on EKS
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

# Create Datadog Agent DaemonSet
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
