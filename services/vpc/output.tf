output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "The id of the vpc created"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnet[*].id
  description = "The public subnet ids"
}

output "public_subnet_cidr" {
  value       = aws_subnet.public_subnet[*].cidr_block
  description = "The public subnet ids"
}
