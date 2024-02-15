resource "aws_internet_gateway" "igw_main" {
  count = terraform.workspace == "stg" ? 0:1
  vpc_id = aws_vpc.vpc_main[0].id
  tags = {
    Name = "igw-${terraform.workspace}"
  }
}

resource "aws_route_table" "route-table-main" {
  count = terraform.workspace == "stg" ? 0:1
  vpc_id = aws_vpc.vpc_main[0].id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_main[0].id
  }
  tags = {
    Name = "rote-pub-${terraform.workspace}"
  }
}

data "aws_route_table" "route_table_dev" {
  count = terraform.workspace == "stg" ? 1 : 0
  filter {
    name = "tag:Name"
    values = ["rote-pub-dev"]
  }
}

resource "aws_route_table_association" "route-table-acc-main" {
  count = terraform.workspace == "stg" ? 0 : 1
  subnet_id = aws_subnet.subnet_pub_main[0].id
  route_table_id = aws_route_table.route-table-main[0].id
}

resource "aws_route_table_association" "route-table-acc-stg" {
  count = terraform.workspace == "stg" ? 1 : 0
  subnet_id = aws_subnet.subnet_pub_stg[0].id
  route_table_id = data.aws_route_table.route_table_dev[0].id
}

