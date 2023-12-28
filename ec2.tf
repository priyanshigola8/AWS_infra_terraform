terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test-1" {
  ami           = "ami-0e5f882be1900e43b"
  instance_type = "t2.micro"
  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }
  tags = {
    Name = "test-1"
  }
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"
}