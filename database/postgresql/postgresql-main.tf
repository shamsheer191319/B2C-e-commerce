resource "aws_db_instance" "postgres" {
  identifier           = "ecommerce-postgres"
  engine              = "postgres"
  engine_version      = "15"
  instance_class      = "db.t3.medium"
  allocated_storage   = 100
  storage_type        = "gp2"
  multi_az            = true
  publicly_accessible = false
  username           = var.db_username
  password           = var.db_password
  parameter_group_name = "default.postgres15"

  backup_retention_period = 7
  backup_window          = "03:00-04:00"
  maintenance_window     = "sun:05:00-sun:06:00"

  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Name = "Ecommerce-PostgreSQL"
    Environment = var.environment
  }
}

# Create Read Replicas
resource "aws_db_instance" "postgres_read_replica" {
  count = length(var.read_replica_regions)

  identifier           = "ecommerce-postgres-replica-${var.read_replica_regions[count.index]}"
  engine              = "postgres"
  engine_version      = "15"
  instance_class      = "db.t3.medium"
  storage_type        = "gp2"
  publicly_accessible = false
  replicate_source_db = aws_db_instance.postgres.identifier
  backup_retention_period = 7

  provider = aws.regional_providers[count.index]

  tags = {
    Name = "Ecommerce-PostgreSQL-Replica"
    Environment = var.environment
  }
}
