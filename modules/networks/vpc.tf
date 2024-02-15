# vpc for dev and prod
resource "aws_vpc" "vpc_main" {
  count = terraform.workspace == "stg" ? 0:1
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "vpc-${terraform.workspace}"
  }
}

# subnet 
resource "aws_subnet" "subnet_pub_main" {
  count = terraform.workspace == "stg" ? 0:1
  vpc_id = aws_vpc.vpc_main[0].id
  cidr_block = var.sub_cidr_block_pub
  availability_zone = var.zone
  tags = {
    Name = "subnet-pub-${terraform.workspace}"
  }
}

resource "aws_subnet" "subnet_priv_main" {
  count = terraform.workspace == "stg" ? 0:1
  vpc_id = aws_vpc.vpc_main[0].id
  availability_zone = var.zone
  cidr_block = var.sub_cidr_block_priv
  tags = {
    Name = "subnet-priv-${terraform.workspace}"
  }
}


# get vpc-dev information and id
data "aws_vpc" "vpc_dev" {
  count = terraform.workspace == "stg" ? 1:0
  filter {
    name = "tag:Name"
    values = ["vpc-dev"]
  }
}

# subnet STG
resource "aws_subnet" "subnet_pub_stg" {
  count = terraform.workspace == "stg" ? 1:0
  vpc_id = data.aws_vpc.vpc_dev[0].id
  cidr_block = var.sub_cidr_block_pub
  availability_zone = var.zone
  tags = {
    Name = "subnet-pub-${terraform.workspace}"
  }
}

resource "aws_subnet" "subnet_priv_stg" {
  count = terraform.workspace == "stg" ? 1:0
  vpc_id = data.aws_vpc.vpc_dev[0].id
  cidr_block = var.sub_cidr_block_priv
  availability_zone = var.zone
  tags = {
    Name = "subnet-priv-${terraform.workspace}"
  }
}

# RDS

resource "aws_subnet" "zone_1" {
  count = terraform.workspace == "stg" ? 0:1
  availability_zone = var.zone_rds[0]
  cidr_block = var.rds_cidr_block_zone_1
  vpc_id = aws_vpc.vpc_main[0].id
  tags = {
    Name = "rds-sub-zone1-${terraform.workspace}"
  }
}

resource "aws_subnet" "zone_2" {
  count = terraform.workspace == "stg" ? 0:1
  availability_zone = var.zone_rds[1]
  cidr_block = var.rds_cidr_block_zone_2
  vpc_id = aws_vpc.vpc_main[0].id
  tags = {
    Name = "rds-sub-zone2-${terraform.workspace}"
  }
}

resource "aws_db_subnet_group" "rds_sub" {
  count = terraform.workspace == "stg" ? 0:1
  name = "main"
  subnet_ids = [aws_subnet.zone_1[0].id, aws_subnet.zone_2[0].id]
  tags = {
    Name = "db-subnetgroup-${terraform.workspace}"
  }
}