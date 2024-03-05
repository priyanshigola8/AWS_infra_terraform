resource "aws_security_group" "test-sg" {
  name        = var.aws_security_group_name
  description = var.aws_security_group_description
  vpc_id      = aws_vpc.test_vpc.id
  tags = {
    Name = var.aws_security_group_tag
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound" {
  security_group_id = aws_security_group.test-sg.id
  cidr_ipv4         = var.security_group_inbound_cidr
  from_port         = var.allow_inbound_from_port
  ip_protocol       = var.inbound_ip_protocol
  to_port           = var.allow_inbound_to_port
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound" {
  security_group_id = aws_security_group.test-sg.id
  cidr_ipv4   = var.security_group_outbound_cidr
  from_port   = var.allow_outbound_from_port
  ip_protocol = var.outbound_ip_protocol
  to_port     = var.allow_outbound_to_port
}

resource "aws_iam_role" "eks-cluster-role" {
  name = var.aws_iam_role_name
  assume_role_policy = var.aws_iam_role_policy
}

resource "aws_iam_role_policy_attachment" "test-AmazonEKSClusterPolicy" {
  policy_arn = var.aws_iam_role_policy_arn
  role       = aws_iam_role.eks-cluster-role.name
}

resource "aws_eks_cluster" "tf_cluster" {
  name     = var.aws_eks_cluster_name
  role_arn = aws_iam_role.eks-cluster-role.arn
  # endpoint = "public"
  access_config {
   authentication_mode = var.aws_eks_access_authentication_mode
   bootstrap_cluster_creator_admin_permissions = var.bootstrap_cluster_creator_admin_permissions
  }

  vpc_config {
    # vpc_id     = aws_vpc.test_vpc.id
    subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
    security_group_ids = [aws_security_group.test-sg.id]
  }
}