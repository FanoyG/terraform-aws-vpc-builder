output "group_name" {
  value = aws_iam_group.this.name
}

output "users" {
  value = [for user in aws_iam_user.this : user.name]
}
