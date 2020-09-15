variable "cluster_name" {
  description = "Input the cluster name"
  type        = string
}

variable "cidr_block" {
  description = "Input the cidr_block range for the vpc"
  type        = string
}

//variable "vpc_remote_state_bucket" {}
//
//variable "vpc_remote_state_key" {}