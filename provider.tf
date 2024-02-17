provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "mybucket"
    key = "project_ec2/terraform.tfstate.d"
    region = "ap-southeast-3"
  }
}
