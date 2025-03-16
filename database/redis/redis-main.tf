resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "ecommerce-redis"
  engine              = "redis"
  node_type           = "cache.t3.medium"
  num_cache_nodes     = 2
  parameter_group_name = "default.redis6.x"
  subnet_group_name   = aws_elasticache_subnet_group.redis_subnet_group.name

  security_group_ids  = [aws_security_group.redis_sg.id]

  tags = {
    Name = "Ecommerce-Redis"
    Environment = var.environment
  }
}
