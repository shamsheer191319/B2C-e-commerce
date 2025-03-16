resource "aws_iam_role" "app_role" {
  name = "EcommerceAppRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "db_access_policy" {
  name        = "EcommerceDBAccessPolicy"
  description = "Least privilege access to RDS and Redis"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = [
        "rds:DescribeDBInstances",
        "rds:Connect",
        "elasticache:DescribeCacheClusters"
      ]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "db_policy_attach" {
  role       = aws_iam_role.app_role.name
  policy_arn = aws_iam_policy.db_access_policy.arn
}
