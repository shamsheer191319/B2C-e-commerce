output "db_endpoint" {
  description = "Primary PostgreSQL database endpoint"
  value       = aws_db_instance.postgres.endpoint
}

output "read_replica_endpoints" {
  description = "PostgreSQL read replica endpoints"
  value       = aws_db_instance.postgres_read_replica[*].endpoint
}
