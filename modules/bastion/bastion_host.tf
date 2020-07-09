resource "aws_instance" "server" {
  ami                         = "ami-08f3d892de259504d"
  instance_type               = local.instance_type
  key_name                    = local.ssh_key
  subnet_id                   = local.subnet_id
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size           = local.disk_size
    delete_on_termination = true
  }

  lifecycle {
    ignore_changes = [ami]
  }

  tags = {
    Name = "Bastion host"
  }
}
