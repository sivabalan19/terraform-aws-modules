output "db_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "The endpoint of the db instance"
}