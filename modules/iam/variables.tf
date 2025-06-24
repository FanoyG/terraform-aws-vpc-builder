variable "group_name" {
  description = "IAM Group Name"
  type = string
}

variable "user_names" {
    description = "List of IAM User names"
    type = list(string)
  
}

variable "default_tags" {
    type =  map(string)
    default = {}
}