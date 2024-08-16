# Return EC2 Instance Public IP
output "instance_output" {
  value = aws_instance.dev000001.public_ip
}