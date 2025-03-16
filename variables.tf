variable "env" {
  type    = string
  default = "dev"
}

variable "regions" {
  default = ["us-east-1", "eu-west-1", "ap-southeast-1"]
}
variable "aws_region" {
  description = "AWS region to deploy the EKS cluster"
  type        = string
  default     = "us-east-1"  
}

variable "aws_region" {
  description = "AWS region to deploy the EKS cluster"
  type        = string
  default     = "us-east-1"  
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS cluster"
  type        = list(string)
}