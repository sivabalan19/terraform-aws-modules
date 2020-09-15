output "redis_cluster_info" {
  value       = aws_elasticache_cluster.redis.cache_nodes
  description = "The ip of the ec2 instance"
}