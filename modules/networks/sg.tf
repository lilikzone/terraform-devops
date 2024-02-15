locals {
  port = [80, 443, 22]
  be = [443, 22 ,4403]
  rds = [3306]
}

resource "aws_security_group" "sg_main_fe" {
    count = terraform.workspace == "stg" ? 0:1
    name = "security-group-fe-${terraform.workspace}"
    vpc_id = aws_vpc.vpc_main[0].id
    tags = {
      Name = "sg-fe-${terraform.workspace}"
    }
    dynamic "ingress" {
      for_each = local.port 
      content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
        from_port = 0
        to_port = 0
    }
}

resource "aws_security_group" "sg_main_be" {
    count = terraform.workspace == "stg" ? 0:1
    name = "security-group-be-${terraform.workspace}"
    vpc_id = aws_vpc.vpc_main[0].id
    tags = {
      Name = "sg-be-${terraform.workspace}"
    }
    dynamic "ingress" {
      for_each = local.be 
      content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
        from_port = 0
        to_port = 0
    }
}

# RDS Security Group
resource "aws_security_group" "sg_main_rds" {
    count = terraform.workspace == "stg" ? 0:1
    name = "security-group-rds-${terraform.workspace}"
    vpc_id = aws_vpc.vpc_main[0].id
    tags = {
      Name = "sg-rds-${terraform.workspace}"
    }
    dynamic "ingress" {
      for_each = local.rds 
      content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
        from_port = 0
        to_port = 0
    }
}