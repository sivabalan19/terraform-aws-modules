variable "subnet_name" {
  description = "subnet for the db instance"
  type        = list(string)
}

variable "sg" {
  description = "sg for db instance"
  type        = list(string)
}

variable "db_instance_type" {
  description = "db instance type"
  type = string
}



