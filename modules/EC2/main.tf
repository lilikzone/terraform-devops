# Frontend
resource "aws_instance" "web-server" {
  ami = var.ami-fe
  instance_type = var.instance-type-fe
  subnet_id = var.subnet-id-fe
  security_groups = [ var.security_groups_fe ]
  availability_zone = var.zone
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
  }
  key_name = var.public_key
  tags = {
    Name = "web-server-${terraform.workspace}"
  }
}

resource "aws_ebs_volume" "ec2_volume" {
  size = 30
  availability_zone = var.zone
  encrypted = true
  tags = {
    Name = "ebs-vol-${terraform.workspace}"
  }
}

resource "aws_volume_attachment" "fe-attch" {
  instance_id = aws_instance.web-server.id
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.ec2_volume.id
}
# Backend 
resource "aws_instance" "be-server" {
  ami = var.ami-be
  instance_type = var.instance-type-be
  subnet_id = var.subnet-id-be
  security_groups = [ var.security_groups_be ]
  availability_zone = var.zone
  key_name = var.public_key
  root_block_device {
    encrypted = true
  }
  tags = {
    Name = "be-server-${terraform.workspace}"
  }
}

resource "aws_ebs_volume" "ec2_volume_be" {
  size = 30
  availability_zone = var.zone
  encrypted = true
  tags = {
    Name = "ebs-vol-${terraform.workspace}"
  }
}

resource "aws_volume_attachment" "be-attch" {
  instance_id = aws_instance.be-server.id
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.ec2_volume_be.id
}