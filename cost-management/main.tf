provider "aws" {
  region = var.aws_region
}

# AWS Budget for cost monitoring and alerts
resource "aws_budgets_budget" "monthly_budget" {
  name         = "monthly-budget-alert"
  budget_type  = "COST"
  limit_amount = var.budget_limit
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

 dynamic "cost_filter" {
    for_each = var.cost_filters
    content {
      name  = cost_filter.key
      values = cost_filter.value
    }
  }
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.alert_threshold
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.alert_emails
  }
}
