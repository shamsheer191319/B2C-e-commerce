output "budget_name" {
  value = aws_budgets_budget.monthly_budget.name
}

output "budget_limit" {
  value = aws_budgets_budget.monthly_budget.limit_amount
}
