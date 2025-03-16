variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    Environment = "Production"
    Owner       = "DevOps Team"
    CostCenter  = "EcommercePlatform"
  }
}

resource "aws_tag" "cost_tags" {
  key   = "CostCenter"
  value = "EcommercePlatform"
}
