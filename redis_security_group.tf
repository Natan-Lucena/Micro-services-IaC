resource "aws_security_group" "redis_sg" {
  name        = "redis-sg"
  description = "Allow Redis access from Bastion"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "Redis Port"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "redis-sg"
  }
}
