# Define Local

locals {
  network_name = "lts_network"                        // Defined a local setting network_name to "lts_network"
}

# Create a VPC
resource "aws_vpc" "lts" {
  cidr_block = var.lts_vpc_10_0_0_0                   // Getting value from variable

  tags = {
    Name = "${local.network_name}-vpc-10.0.0.0"       // should set tag as "lts_network-vpc-10.0.0.0"
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
resource "aws_instance" "dev000004" {
  ami           = var.ami_rhel8                       // Getting value from variable 
  instance_type = var.instance_type_t2_micro          // Getting value from variable

  tags = {
    Name = "dev000004"
    Environment = "Dev/Test"
  }
}


data "aws_vpc" "get_vpc_data" {
    filter {
        name = "tag:Name"
        values = ["lts_network-vpc-10.0.0.0"]
    }
}

output "get_vpc_data_output" {
    value = data.aws_vpc.get_vpc_data.cidr_block
}


data "aws_instance" "get_instance_data" {
    filter {
        name = "tag:Name"
        values = ["dev000004"]
    }

    filter {
        name = "tag:Environment"
        values = ["Dev/Test"]
    }
}

output "get_instance_data_output" {
    value = data.aws_instance.get_instance_data.public_ip
}