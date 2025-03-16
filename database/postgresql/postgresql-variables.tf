variable "db_username" {
  description = "PostgreSQL master username"
  type        = string
}

variable "db_password" {
  description = "PostgreSQL master password"
  type        = string
  sensitive   = true
}

variable "read_replica_regions" {
  description = "Regions for PostgreSQL read replicas"
  type        = list(string)
  default     = ["us-east-1", "eu-west-1", "ap-southeast-1"]
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}
