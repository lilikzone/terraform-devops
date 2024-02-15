# vpc and subnet
module "aws_vpc" {
    source = "./modules/networks"
    vpc_cidr_block = var.vpc_cidr_block
    sub_cidr_block_pub = lookup(var.sub_cidr_block_pub, terraform.workspace)
    sub_cidr_block_priv = lookup(var.sub_cidr_block_priv, terraform.workspace)
    zone = var.zone[0]
    rds_cidr_block_zone_1 = lookup(var.zone_1, terraform.workspace)
    rds_cidr_block_zone_2 = lookup(var.zone_2, terraform.workspace)
    zone_rds = var.zone
  }

module "ec2-main" {
  count = terraform.workspace == "stg" ? 0:1
  source = "./modules/EC2"
  ami-fe = var.ami-image
  ami-be = var.ami-image
  instance-type-fe = lookup(var.instance-type-fe, terraform.workspace)
  instance-type-be = lookup(var.instance-type-be, terraform.workspace)
  subnet-id-fe = module.aws_vpc.subnet_id_pub
  subnet-id-be = module.aws_vpc.subnet_id_priv
  zone = var.zone[count.index]
  security_groups_be = module.aws_vpc.security_groups_be
  security_groups_fe = module.aws_vpc.security_groups_fe
  public_key = aws_key_pair.key_pair.key_name
}

data "aws_security_group" "sg_fe_stg" {
  count = terraform.workspace == "stg" ? 1:0
  filter {
    name = "tag:Name"
    values = [ "sg-fe-dev" ]
  }
}

data "aws_security_group" "sg_be_stg" {
  count = terraform.workspace == "stg" ? 1:0
  filter {
    name = "tag:Name"
    values = ["sg-be-dev"]
  }
}

module "ec2-stg" {
  count = terraform.workspace == "stg" ? 1:0
  source = "./modules/EC2"
  ami-fe = var.ami-image
  ami-be = var.ami-image
  instance-type-fe = lookup(var.instance-type-fe, terraform.workspace)
  instance-type-be = lookup(var.instance-type-be, terraform.workspace)
  subnet-id-fe = module.aws_vpc.subnet_id_pub_stg
  subnet-id-be = module.aws_vpc.subnet_id_priv_stg
  zone = var.zone[count.index]
  security_groups_be = data.aws_security_group.sg_be_stg[0].id
  security_groups_fe = data.aws_security_group.sg_fe_stg[0].id
  public_key = aws_key_pair.key_pair.key_name
}

# RDS Database
module "aws_db_instance" {
  source = "./modules/rds"
  instance_class = lookup(var.instance-type-rds, terraform.workspace)
  rds_sg = module.aws_vpc.rds_sg
  rds_sub_grop = module.aws_vpc.subnet_ids_rds
}
