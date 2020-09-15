variable "ec2_ingress" {
  description = "ingress for the ec2 instance"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = number
    cidr_blocks = list(string)
  }))
}

variable "majorcomponents_ingress" {
  description = "ingress for the major components"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = number
  }))
}


variable "main_vpc" {
  description = "ingress for the major components"
  type        = string
}