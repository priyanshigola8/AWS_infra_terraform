resource "aws_instance" "test-1" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.tags
  }
}

resource "aws_vpc" "test_vpc" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"
}