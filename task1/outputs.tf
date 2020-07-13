output "vpc_id" {
  value = module.vpc.vpc_id
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "bastion_public_dns" {
  value = module.bastion.public_dns
}

output "ec2_private_ip" {
  value = module.my_ec2_instance.private_ip
}
