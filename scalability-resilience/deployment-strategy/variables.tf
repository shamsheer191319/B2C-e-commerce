variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "ecommerce-app"
}

variable "replica_count" {
  description = "Number of application replicas"
  type        = number
  default     = 5
}

variable "container_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "myrepo/ecommerce-app:latest"
}

variable "cpu_request" {
  description = "CPU request for the container"
  type        = string
  default     = "100m"
}

variable "memory_request" {
  description = "Memory request for the container"
  type        = string
  default     = "256Mi"
}

variable "cpu_limit" {
  description = "CPU limit for the container"
  type        = string
  default     = "500m"
}

variable "memory_limit" {
  description = "Memory limit for the container"
  type        = string
  default     = "512Mi"
}

variable "max_surge" {
  description = "Maximum number of pods that can be created above the desired number of pods during an update"
  type        = string
  default     = "25%"
}

variable "max_unavailable" {
  description = "Maximum number of pods that can be unavailable during an update"
  type        = string
  default     = "25%"
}

variable "strategy" {
  description = "Deployment strategy type"
  type        = string
  default     = "RollingUpdate"
  
}
