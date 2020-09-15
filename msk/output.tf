output "bootstrap" {
  value = aws_msk_cluster.sentry_msk.bootstrap_brokers_tls
  description = "the bootstrap brokers info"
}

output "zookeeper" {
  value = aws_msk_cluster.sentry_msk.zookeeper_connect_string
  description = "the zookeeper connection string"
}