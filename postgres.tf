locals {
  shard_names = [for i in range(var.num_shards) : "${var.db_identifier}-shard-${i + 1}"]
}

resource "aws_db_subnet_group" "postgres" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "${var.db_identifier}-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  for_each               = toset(local.shard_names)
  identifier             = each.key
  engine                 = "postgres"
  engine_version         = "12"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20

  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password

  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.postgres.name

  skip_final_snapshot    = true
  deletion_protection    = false

  tags = {
    Environment = "dev"
    Name        = each.key
  }
}
