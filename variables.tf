variable "rabbit_mq_username" {
  type        = string
  description = "Username for RabbitMQ"
  sensitive   = true
}

variable "rabbit_mq_password" {
  type        = string
  description = "password for RabbitMQ"
  sensitive   = true
}