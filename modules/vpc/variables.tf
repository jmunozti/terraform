variable "vpc_cidr" {
  description = "Defines the VPC's CIDR block"
  default     = "10.0.0.0/16"
}

variable "tenancy" {
  description = "Defines the tenancy option for instances into the VPC."
  default     = "default"
}

variable "vpc_id" {
  description = "A VPC identifier must be supplied."
}

variable "public_subnet_cidr" {
  description = "Defines a public subnet CIDR"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "Defines a private subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "availability_zone_1" {
  description = "Defines an Availability_zone to start the instance in"
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Defines an Availability_zone to start the instance in"
  default     = "us-east-1b"
}
