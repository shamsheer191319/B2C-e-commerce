output "postgresql_endpoint" {
  value = module.postgresql.db_endpoint
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}
