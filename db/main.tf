resource "aws_db_subnet_group" "db_subnet" {
  name       = "sentry-db-subnet"
  subnet_ids = var.subnet_name

  tags = {
    Name = "senty_db_subnet"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "9.6.1"
  instance_class       = var.db_instance_type
  name                 = "postgres"
  username             = "postgres"
  password             = "postgres"
  parameter_group_name = "default.postgres9.6"
  db_subnet_group_name = aws_db_subnet_group.db_subnet.id
  vpc_security_group_ids = var.sg
  skip_final_snapshot = true

  tags = {
    Name = "sentry-db-instance"
  }
}