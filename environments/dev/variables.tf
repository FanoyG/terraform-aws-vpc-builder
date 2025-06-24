variable "group_name" {
  type = string
}

variable "user_names" {
  type = list(string)
}

variable "group_policy_arns" {
  type = list(string)
}

variable "default_tags" {
  type = map(string)
}
