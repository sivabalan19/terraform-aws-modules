variable "subnet" {
  description = "subnet for the ec2 instance"
  type        = string
}

variable "ec2_sg" {
  description = "sg for ec2 instance"
  type        = list(string)
}

variable "instance_type" {
  description = "instance type for ec2"
  type        = string
}

variable "ssh_private_key" {
  description = "the ssh private key location"
  default = "/Users/vinothakumar/sentrykey"
}

