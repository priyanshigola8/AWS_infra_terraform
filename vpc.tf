resource "aws_vpc" "test_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_tags
 }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.public_subnet_az
  tags = {
    Name = var.public_subnet_tags
 }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_subnet_az
  tags = {
    Name = var.private_subnet_tags
 }
}

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.test_vpc.id
 tags = {
   Name = var.gw_tags
 }
}

resource "aws_route_table" "second_rt" {
 vpc_id = aws_vpc.test_vpc.id
 route {
   cidr_block = var.route_table_cidr
   gateway_id = aws_internet_gateway.gw.id
 }
 tags = {
   Name = var.route_table_tags
 }
}

resource "aws_route_table_association" "public_subnet_asso" {
 subnet_id      = aws_subnet.public_subnet.id
 route_table_id = aws_route_table.second_rt.id
}

# resource "aws_eip" "elastic_ip" {
 
# }