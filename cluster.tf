resource "aws_security_group" "test-sg" {
  name        = "terra-sg"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.test_vpc.id
  tags = {
    Name = "allow_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound" {
  security_group_id = aws_security_group.test-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound" {
  security_group_id = aws_security_group.test-sg.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp" 
  to_port     = 80
}

resource "aws_iam_role" "eks-cluster-role" {
  name = "eks-cluster-role-1"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "test-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster-role.name
}

resource "aws_eks_cluster" "tf_cluster" {
  name     = "test-cluster"
  role_arn = aws_iam_role.tf_cluster.arn
  endpoint = "public"
  access_config {
   authentication_mode = "CONFIG_MAP" 
   bootstrap_cluster_creator_admin_permissions = true
  }

  vpc_config {
    vpc_id     = aws_vpc.test_vpc.id
    subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
    security_group_ids = aws_security_group.test-sg.id
  }
}