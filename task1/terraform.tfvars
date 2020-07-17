
region              = "us-east-1"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.0.0/24"
private_subnet_cidr = "10.0.1.0/24"
ssh_key             = "ssh-key"
instance_type       = "t2.micro"
ami_id              = "ami-08f3d892de259504d"
ec2_count           = "1"
environment         = "staging"
elb_is_internal     = true
