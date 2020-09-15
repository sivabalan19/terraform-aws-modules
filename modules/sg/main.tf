resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow ssh and nginx connection"
  vpc_id      = var.main_vpc

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.ec2_ingress

    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = "ec2_security_group"
  }
}

resource "aws_security_group" "majorcomponents_ingress" {
  name        = "majorcomponents_sg"
  description = "Allow all tcp redis db and ec2"
  vpc_id      = var.main_vpc

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.majorcomponents_ingress

    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      security_groups = [aws_security_group.ec2_sg.id]
    }
  }

  tags = {
    Name = "major_comp_sg"
  }
}

