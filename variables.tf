########################################## EC2 instance ##################################################

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
# variable "cidr_block" {
#   type        = string
#   description = "vpc cidr block"
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

####################################### s3 bucket #################################################

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

################################################## VPC #####################################################

variable "cidr_block" {
  type = string
  description = "VPC CIDR range"
}
variable "vpc_tags" {
  type = string
  description = "VPC tag"
}

################################################## Subnets #####################################################

variable "public_subnet_cidr" {
  type = string
  description = "Public subnet CIDR range"
}
variable "public_subnet_az" {
  type = string
  description = "Public subnet availabilty zone"
}
variable "public_subnet_tags" {
  type = string
  description = "Public subnet tag"
}
variable "private_subnet_cidr" {
  type = string
  description = "Private subnet CIDR range"
}
variable "private_subnet_az" {
  type = string
  description = "Private subnet availabilty zone"
}
variable "private_subnet_tags" {
  type = string
  description = "Private subnet tag"
}

################################################## Internet Gateway #####################################################

variable "gw_tags" {
  type = string
  description = "Internet Gateway tag"
}

#################################################### Route Tables #####################################################

variable "route_table_cidr" {
  type = string
  description = "Route table CIDR range"
}
variable "route_table_tags" {
  type = string
  description = "Route table tag"
}

########################################################### Security Group ################################################

variable "aws_security_group_name" {
  type = string
  description = "aws_security_group name"
}
variable "aws_security_group_description" {
  type = string
  description = "aws_security_group description"
}
variable "aws_security_group_tag" {
  type = string
  description = "aws security group tags"
}
variable "security_group_inbound_cidr" {
  type = string
  description = "CIDR range to allow inbound traffic"
}
variable "allow_inbound_from_port" {
  type = number
  description = "allow inbound traffic from port number"
}
variable "inbound_ip_protocol" {
  type = string
  description = "Inbound ip protocol"
}
variable "allow_inbound_to_port" {
  type = number
  description = "allow inbound traffic to port number"
}
variable "security_group_outbound_cidr" {
  type = string
  description = "CIDR range to allow outbound traffic"
}
variable "allow_outbound_from_port" {
  type = number
  description = "allow outbound traffic from port number"
}
variable "outbound_ip_protocol" {
  type = string
  description = "Outbound ip protocol"
}
variable "allow_outbound_to_port" {
  type = number
  description = "allow outbound traffic to port number"
}

#################################################### IAM Role ######################################################

variable "aws_iam_role_name" {
  type = string
  description = "aws iam role name"
}
variable "aws_iam_role_policy" {
  type = string
  description = "aws iam role policy"
}
variable "aws_iam_role_policy_arn" {
  type = string
  description = "aws iam role policy arn"
}

################################################ EKS Cluster #########################################################

variable "aws_eks_cluster_name" {
  type = string
  description = "aws eks cluster name"
}
variable "aws_eks_access_authentication_mode" {
  type = string
  description = "aws eks access authentication mode"
}
variable "bootstrap_cluster_creator_admin_permissions" {
  type = bool
  description = "aws eks bootstrap cluster creator admin permissions"
}
