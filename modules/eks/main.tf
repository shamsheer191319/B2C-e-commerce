provider "aws" {
  region = var.aws_region
}

# Create EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = "ecommerce-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [aws_iam_role_policy_attachment.eks_policy]
}
