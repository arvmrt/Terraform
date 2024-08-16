# Create a VPC
resource "aws_vpc" "lts" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "lts-vpc-10.0.0.0"
  }
}

# Create a Subnet
resource "aws_subnet" "lts-subnet-10-0-1-0" {
  vpc_id = aws_vpc.lts.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-10.0.1.0"
  }
}

# Create a t2 instance
resource "aws_instance" "dev000001" {
  ami = "ami-0583d8c7a9c35822c" //RedHat 8
  instance_type = "t2.micro"

  tags = {
    Name = "dev000001"
    Environment = "Dev/Test"
  }
}