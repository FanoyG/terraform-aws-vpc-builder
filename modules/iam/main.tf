resource "aws_iam_group" "this" {
  name = var.group_name
}

resource "aws_iam_user" "this" {
  for_each = toset(var.user_names)
  name     = each.value

  tags = var.default_tags
}


resource "aws_iam_user_group_membership" "membership" {
  for_each = toset(var.user_names)
  user     = each.value
  groups   = [aws_iam_group.this.name]
}

resource "aws_iam_group_policy_attachment" "group_policies" {
  count      = var.group_policy_arns != [] ? length(var.group_policy_arns) : 0
  group      = aws_iam_group.this.name
  policy_arn = var.group_policy_arns[count.index]
}
