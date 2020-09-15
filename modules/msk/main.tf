resource "aws_msk_cluster" "sentry_msk" {
  cluster_name           = "sentry-msk"
  kafka_version          = "2.4.1"
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type   = var.kafka_node_type
    ebs_volume_size = 50
    client_subnets = var.subnets
    security_groups = var.sg
  }

  tags = {
    key = "Name"
    value = "Sentry_msk_cluster"
  }
}