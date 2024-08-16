# Define Local

locals {
  network_name = "lts_network"                        // Defined a local setting network_name to "lts_network"
}

# Create a VPC
resource "aws_vpc" "lts" {
  cidr_block = var.lts_vpc_10_0_0_0                   // Getting value from variable

  tags = {
    Name = "${local.network_name}-vpc-10.0.0.0"       // should set tag as "lts_network-vpc-10.0.o.0"
  }
}

# Create a Subnet
resource "aws_subnet" "lts-subnet-10-0-1-0" {
  vpc_id     = aws_vpc.lts.id
  cidr_block = var.lts_subnet_10_0_1_0                // Getting value from variable

  tags = {
    Name = "${local.network_name}-subnet-10.0.1.0"    // should set tag as "lts_network-subnet-10.0.1.0"
  }
}

# Create a t2 instance
resource "aws_instance" "dev000003" {
  ami           = var.ami_rhel8                       // Getting value from variable 
  instance_type = var.instance_type_t2_micro          // Getting value from variable

  tags = {
    Name = "dev000003"
    Environment = "Dev/Test"
  }
}