# Return VPC ID
output "vpc_output" {
  value = aws_vpc.lts.id
}

# Return Subnet ID
output "subnet_output" {
  value = aws_subnet.lts-subnet-10-0-1-0.id
}

# Return EC2 Instance Public IP
output "instance_output" {
  value = aws_instance.dev000004.public_ip
}