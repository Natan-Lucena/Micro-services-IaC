resource "aws_security_group" "rabbitmq_public_sg" {
  name        = "rabbitmq-public-web"
  description = "Allow public access to RabbitMQ web UI"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow RabbitMQ Web UI"
    from_port   = 15672
    to_port     = 15672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rabbitmq-public-web"
  }
}
