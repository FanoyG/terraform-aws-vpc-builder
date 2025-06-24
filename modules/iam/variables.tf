variable "group_name" {
  description = "IAM Group Name"
  type        = string

  validation {
    condition = length(var.group_name) > 3 && length(var.group_name) < 64
    error_message = "Group name must be between 4 and 63 characters."
  }
}

variable "user_names" {
  description = "List of IAM User names"
  type        = list(string)

  validation {
    condition = alltrue([
        for name in var.user_names : can(regex("^[a-zA-Z][a-zA-Z0-9]{3,63}$", name))
    ])
    error_message = "Each IAM username must be 1-64 characters and match IAM naming rules."
  }

}

variable "default_tags" {
  type    = map(string)
  default = {}
}

variable "group_policy_arns" {
  type        = list(string)
  default     = []
  description = "List of IAM managed policy ARNs to attach to the group"


    validation {
    condition = alltrue([
      for arn in var.group_policy_arns : can(regex("^arn:aws:iam::aws:policy/.+", arn))
    ])
    error_message = "Each policy ARN must be a valid managed policy under aws:policy."
  }
}
