terraform {
  required_version = " >= 1.7"
}

resource "aws_db_instance" "mydb" {
    count = terraform.workspace == "stg" ? 0:1
    allocated_storage = 10
    identifier = "rds-${terraform.workspace}"
    db_name = "my_db"
    engine = "mysql"
    engine_version = "5.7"
    storage_encrypted = true
    vpc_security_group_ids = [var.rds_sg]
    db_subnet_group_name = var.rds_sub_grop
    instance_class = var.instance_class
    multi_az = false
    username = "mydb"
    password = "mydbpass"
    skip_final_snapshot = true
    publicly_accessible = false
}

