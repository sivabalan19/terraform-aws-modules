variable "node_type" {
  description = "nodetype for the redis cluster"
  type        = string
}

variable "sg" {
  description = "sg for the redis cluster"
  type        = list(string)
}

variable "subnet_ids" {
  description = "subnet for the redis cluster"
  type        = list(string)
}

