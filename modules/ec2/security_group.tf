resource "aws_security_group" "ec2" {
  name        = "EC2 host SG"
  description = "Allow SSH access to EC2 host though a bastion"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "EC2 Security Group"
  }
}

resource "aws_security_group_rule" "ssh" {
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = [var.private_subnet_cidr]
  security_group_id = aws_security_group.ec2.id
}
