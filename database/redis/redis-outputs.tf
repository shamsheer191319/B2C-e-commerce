output "redis_endpoint" {
  description = "Redis endpoint"
  value       = aws_elasticache_cluster.redis.endpoint
}
