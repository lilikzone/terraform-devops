# vpc and subnet variable
variable "vpc_cidr_block" {
  type = string
}

variable "sub_cidr_block_pub" {
  type = string
}

variable "sub_cidr_block_priv" {
  type  = string
}

variable "zone" {
  type = string
}

variable "rds_cidr_block_zone_1" {
  type = string
}


variable "rds_cidr_block_zone_2" {
  type = string
}

variable "zone_rds" {
  type = list
}