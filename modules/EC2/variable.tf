variable "ami-fe" {
  type = string
}

variable "instance-type-fe" {
  type = string
}

variable "subnet-id-fe" {
  type = string
}

variable "ami-be" {
  type = string
}

variable "instance-type-be" {
  type = string
}

variable "subnet-id-be" {
  type = string
}

variable "zone" {
  type = string
}

variable "security_groups_fe" {
  type = string
}

variable "security_groups_be" {
  type = string
}

variable "public_key" {
  type = string
}