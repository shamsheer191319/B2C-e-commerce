variable "aws_region" {
  description = "AWS Region for cost monitoring"
  default     = "us-east-1"
}

variable "budget_limit" {
  description = "Monthly budget limit in USD"
  default     = "500"
}

variable "alert_threshold" {
  description = "Percentage threshold for alerts"
  default     = 90
}

variable "alert_emails" {
  description = "Email addresses for budget alerts"
  type        = list(string)
  default     = ["devops-team@example.com"]
}

variable "account_ids" {
  description = "List of AWS Account IDs to track costs"
  type        = list(string)
  default     = ["123456789012"]
}
variable "cost_filters" {
  description = "Cost filters for AWS Budget"
  type        = map(list(string))
  default = {
    "Service" = ["Amazon EC2", "Amazon RDS", "Amazon EKS"]
  }
}

