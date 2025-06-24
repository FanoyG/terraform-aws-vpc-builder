output "group_name" {
  value = aws_iam_group.this.name
}

output "users" {
  value = aws_iam_user.this[*].name
}
