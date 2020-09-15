output "ec2_sg_id" {
  value       = aws_security_group.ec2_sg.id
  description = "The ec2 sg group id"
}
output "majcom_sg_id" {
  value = aws_security_group.majorcomponents_ingress.id
  description = "the major components sg group id"
}