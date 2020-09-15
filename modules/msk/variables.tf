variable "kafka_node_type" {
  description = "the kafka node type"
  type = string
}

variable "subnets" {
  description = "the subnets for msk"
  type = list(string)
}

variable "sg" {
  description = "the sg for msk"
  type = list(string)
}
