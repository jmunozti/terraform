provider "aws" {
  version = "~> 2.0"
  region  = local.aws_region
}

module "task1" {
  source              = "../modules/vpc"
  vpc_cidr            = local.vpc_cidr
  tenancy             = local.tenancy
  vpc_id              = "${module.task1.vpc_id}"
  public_subnet_cidr  = local.public_cidr
  private_subnet_cidr = local.private_cidr
}

module "bastion" {
  source            = "../modules/bastion"
  subnet_id         = "${module.task1.public_subnet_id}"
  ssh_key           = local.key_pair
  internal_networks = [local.private_cidr]
}

module "my_ec2_instance" {
  vpc_id        = "${module.task1.vpc_id}"
  ami_id        = local.ami
  ssh_key       = local.key_pair
  source        = "../modules/ec2"
  ec2_count     = local.ec2_count
  instance_type = local.instance_type
  subnet_id     = "${module.task1.private_subnet_id}"
}

terraform {
  backend "s3" {
    bucket = "2020-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}
