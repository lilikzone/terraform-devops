# Net Var
variable "vpc_cidr_block" {
  type =  string
}

variable "sub_cidr_block_pub" {
  type = map
}

variable "sub_cidr_block_priv" {
  type = map
}

variable "rds_sub_cidr" {
  type = map
}

# RDS
variable "zone_1" {
  type = map  
}
variable "zone_2" {
  type = map  
}
#ec2 variable

variable "ami-image" {
  type = string
}

variable "instance-type-fe" {
  type = map
}

variable "instance-type-be" {
  type = map
}

variable "instance-type-rds" {
  type = map
}

variable "zone" {
  default = ["ap-southeast-3a", "ap-southeast-3b", "ap-southeast-3c" ]
}