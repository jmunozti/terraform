provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

module "vpc" {
  source              = "../modules/vpc"
  vpc_cidr            = var.vpc_cidr
  tenancy             = var.tenancy
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  environment         = var.environment
}

module "bastion" {
  source            = "../modules/bastion"
  subnet_id         = module.vpc.public_subnet_id
  ssh_key           = var.ssh_key
  internal_networks = [var.private_subnet_cidr]
  environment       = var.environment
}

module "ec2" {
  source        = "../modules/ec2"
  vpc_id        = module.vpc.vpc_id
  ami_id        = data.aws_ami.amazon-linux-2.id
  ssh_key       = var.ssh_key
  ec2_count     = var.ec2_count
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnet_id
  environment   = var.environment
}

module "elb" {
  source      = "../modules/elb"
  vpc_id      = module.vpc.vpc_id
  subnet_id   = module.vpc.private_subnet_id
  environment = var.environment
  internal    = var.elb_is_internal
}

module "asg" {
  source              = "../modules/asg"
  vpc_id              = module.vpc.vpc_id
  ami_id              = data.aws_ami.amazon-linux-2.id
  instance_type       = var.instance_type
  ssh_key             = var.ssh_key
  min_size            = var.min_size
  max_size            = var.max_size
  vpc_zone_identifier = module.vpc.private_subnet_id
  health_check_type   = var.health_check_type
  internal_networks   = [var.private_subnet_cidr]
  load_balancers      = module.elb.elb_name
  environment         = var.environment
}

terraform {
  backend "s3" {
    bucket = "2020-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}
