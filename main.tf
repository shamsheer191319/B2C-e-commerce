module "network_us" {
  source  = "./modules/network"
  region  = "us-east-1"
  vpc_cidr = "10.0.0.0/16"
  providers = {
    aws = aws.us-east
  }
}

module "network_eu" {
  source  = "./modules/network"
  region  = "eu-west-1"
  vpc_cidr = "10.1.0.0/16"
  providers = {
    aws = aws.eu-west
  }
}

module "network_ap" {
  source  = "./modules/network"
  region  = "ap-southeast-1"
  vpc_cidr = "10.2.0.0/16"
  providers = {
    aws = aws.ap-southeast
  }
}

module "alb_us" {
  source      = "./modules/load_balancer"
  vpc_id      = module.network_us.vpc_id
  subnets     = module.network_us.public_subnets
  region      = "us-east-1"
  providers = {
    aws = aws.us-east
  }
}

module "alb_eu" {
  source      = "./modules/load_balancer"
  vpc_id      = module.network_eu.vpc_id
  subnets     = module.network_eu.public_subnets
  region      = "eu-west-1"
  providers = {
    aws = aws.eu-west
  }
}

module "alb_ap" {
  source      = "./modules/load_balancer"
  vpc_id      = module.network_ap.vpc_id
  subnets     = module.network_ap.public_subnets
  region      = "ap-southeast-1"
  providers = {
    aws = aws.ap-southeast
  }
}

resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = module.alb_us.alb_dns
    origin_id   = "US-ALB"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "US-ALB"

    viewer_protocol_policy = "redirect-to-https"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
provider "aws" {
  region = var.aws_region
}

# Get the VPC ID dynamically
data "aws_vpc" "selected" {
  default = true  # Use the default VPC (or modify to fetch a specific one)
}

# Fetch the subnets from the selected VPC
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Pass the fetched subnet IDs to EKS
resource "aws_eks_cluster" "main" {
  name     = "ecommerce-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = data.aws_subnets.selected.ids  # Dynamically retrieved subnets
  }

  depends_on = [aws_iam_role_policy_attachment.eks_policy]
}

