resource "aws_vpc" "test_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "Project VPC"
 }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "public"
 }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "172.16.20.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "private"
 }
}

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.test_vpc.id
 
 tags = {
   Name = "VPC IG"
 }
}

resource "aws_route_table" "second_rt" {
 vpc_id = aws_vpc.test_vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gw.id
 }
 
 tags = {
   Name = "2nd Route Table"
 }
}

resource "aws_route_table_association" "public_subnet_asso" {
 subnet_id      = aws_subnet.public_subnet.id
 route_table_id = aws_route_table.second_rt.id
}