# output "rds_sub_grop" {
#   value = length(aws_db_subnet_group.rds_sub) > 0 ? aws_db_subnet_group.rds_sub[0].name : ""
# }