variable "ami_rhel8" {
   type        = string
   description = "RHEL8 AMI in us-east-1"
}

variable "instance_type_t2_micro" {
   type        = string
   description = "Instance type"
}

variable "lts_vpc_10_0_0_0" {
   type        = string
   description = "VPC cidr"
}

variable "lts_subnet_10_0_1_0" {
   type        = string
   description = "Subnet cidr"
}