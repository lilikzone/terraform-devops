output "vpc_id" {
  # value = length(aws_vpc.vpc_main) > 0 ? aws_vpc.main[0].id : ""
  value = module.aws_vpc.vpc_id
}
output "subnet_id_pub" {
  # value = length(module.aws_vpc.subnet_id_pub) >0 ? module.aws_vpc.subnet_id_pub[0].id : ""
  value = module.aws_vpc.subnet_id_pub
}

output "subnet_id_priv" {
  # value = length(module.aws_vpc.subnet_id_priv) >0 ? module.aws_vpc.subnet_id_priv[0].id : ""
  value = module.aws_vpc.subnet_id_priv

}

output "subnet_id_pub_stg" {
  # value = length (module.aws_vpc.subnet_id_pub_stg) > 0 ? module.aws_vpc.subnet_id_pub_stg[0].id : ""
  value = module.aws_vpc.subnet_id_pub_stg
}

output "subnet_id_priv_stg" {
  # value = length(module.aws_vpc.subnet_id_priv_stg) > 0 ? module.aws_vpc.subnet_id_priv_stg[0].id : ""
  value = module.aws_vpc.subnet_id_priv_stg
}

output "db_subnet_group_name" {
  value = module.aws_vpc.subnet_ids_rds
}

output "security_groups_fe" {
  value = module.aws_vpc.security_groups_fe
}

output "security_groups_be" {
  value = module.aws_vpc.security_groups_be
}

output "security_groups_rds" {
  value = module.aws_vpc.rds_sg
}

output "ip_public_webserver" {
  value = length(module.ec2-main) > 0 ? module.ec2-main[0].public_web_server : ""
}

output "ip_public_webserver_stg" {
  value = length(module.ec2-stg) > 0 ? module.ec2-stg[0].public_web_server : ""
}