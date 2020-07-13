
variable "region" {
  description = "Defines the AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Defines the VPC's CIDR block"
  default     = "10.0.0.0/16"
}

variable "tenancy" {
  description = "Defines the tenancy option for instances into the VPC."
  default     = "default"
}

variable "public_subnet_cidr" {
  description = "Defines a public subnet CIDR"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "Defines a private subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "ssh_key" {
  description = "The key name of the Key Pair to use for the instance."
  default     = "bastion"
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Defines the AMI id used to launch EC2 instances"
  default     = "ami-08f3d892de259504d"
}

variable "ec2_count" {
  description = "Defines the number of EC2 instances"
  default     = "1"
}
