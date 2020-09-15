resource "aws_elasticache_subnet_group" "redis_subnet" {
  name       = "sentry-redis-subnet"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster"
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  security_group_ids   = var.sg
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet.id
  engine_version       = "5.0.0"
  port                 = 6379
}