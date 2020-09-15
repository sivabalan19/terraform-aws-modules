output "ec2_ip" {
  value       = aws_instance.ec2_instance.public_ip
  description = "The ip of the ec2 instance"
}