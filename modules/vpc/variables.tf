variable "vpc_cidr" {
  description       = "CIDR Block for the VPC"
  type              = string
}

variable "project_name" {
  description = "Name prefix for all resources."
  type =  string
}

variable "default_tags" {
  description = "Tags applied to all resources."
  type = map(string)
  default = {}
}


variable "public_subnets" {
  description = "Lists of public subnets CIDRs"
  type = list(string)
}


variable "private_subnets" {
  description = "Lists of private subnets CIDRs"
  type = list(string)
}

variable "availability_zones" {
  description = "Lists of All AZs to Use"
  type = list(string)
}