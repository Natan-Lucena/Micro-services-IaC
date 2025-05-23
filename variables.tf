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

variable "db_identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "num_shards" {
  type    = number
  default = 1
  description = "Number of PostgreSQL shards to create"
}

variable "public_key_path" {
  description = "Public key path"
  type        = string
}