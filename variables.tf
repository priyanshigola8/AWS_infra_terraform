variable "ami" {
  type        = string
  description = "Name of the ami"
}

variable "instance_type" {
  type        = string
  description = "Name of the instance type"
}

variable "tags" {
  type        = string
  description = "common tag"
}

variable "cidr_block" {
  type        = string
  description = "vpc cidr block"
}

variable "vpc_name" {
  type        = string
  description = "Name of the vNet"
}

variable "access_key" {
  type = string
  description = "access key"
}

variable "secret_key" {
  type = string
  description = "secret key"
}

variable "region" {
  type = string
  description = "region"
}