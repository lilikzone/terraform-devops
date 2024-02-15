output "vpc_id" {
  # value = length(aws_vpc.vpc_main) > 0 ? aws_vpc.main[0].id : ""
  value = length(aws_vpc.vpc_main) > 0 ? aws_vpc.vpc_main[0].id : ""
}

output "subnet_id_pub" {
  value = length(aws_subnet.subnet_pub_main) > 0 ? aws_subnet.subnet_pub_main[0].id : ""
}

output "subnet_id_priv" {
  value = length(aws_subnet.subnet_priv_main) > 0 ? aws_subnet.subnet_priv_main[0].id : ""
}

output "subnet_id_pub_stg" {
  value = length (aws_subnet.subnet_pub_stg) > 0 ? aws_subnet.subnet_pub_stg[0].id : ""
}

output "subnet_id_priv_stg" {
  value = length (aws_subnet.subnet_priv_stg) > 0 ? aws_subnet.subnet_priv_stg[0].id : "" 
}

output "security_groups_fe" {
  value = length(aws_security_group.sg_main_fe) > 0 ? aws_security_group.sg_main_fe[0].id : ""
}

output "security_groups_be" {
  value = length(aws_security_group.sg_main_be) > 0 ? aws_security_group.sg_main_be[0].id : ""
}

output "rds_sg" {
  value = length(aws_security_group.sg_main_rds) > 0 ? aws_security_group.sg_main_rds[0].id : ""
}

output "subnet_ids_rds" {
  value = length(aws_db_subnet_group.rds_sub) > 0 ? aws_db_subnet_group.rds_sub[0].id : ""
}