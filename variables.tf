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

# variable "vpc_name" {
#   type        = string
#   description = "Name of the vNet"
# }

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

### s3 bucket
variable "bucket" {
  type = string
  description = "Name of the S3 bucket"
}

variable "block_public_acls" {
  type = bool
  description = "Permission to block the public acls "
}

variable "block_public_policy" {
  type = bool
  description = "Permission to block the public policy "
}

variable "ignore_public_acls" {
  type = bool
  description = "Permission to ignore the public acls "
}

variable "restrict_public_buckets" {
  type = bool
  description = "Permission to restrict the public buckets "
}

variable "versioning_configuration" {
  type = string
  description = "bucket versioning "
}

variable "Environment" {
  type = string
  description = "tag"
}

variable "s3_tags" {
  type = string
  description = "tag"
}