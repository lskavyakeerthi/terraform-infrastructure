output "vpc_id" {
  description = "Created VPC ID."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Created public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "ec2_instance_ids" {
  description = "Created EC2 instance IDs."
  value       = aws_instance.web[*].id
}

output "ec2_public_ips" {
  description = "Public IP addresses of the EC2 instances."
  value       = aws_instance.web[*].public_ip
}

output "ec2_public_dns" {
  description = "Public DNS names of the EC2 instances."
  value       = aws_instance.web[*].public_dns
}
