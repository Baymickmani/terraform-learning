resource "aws_iam_group" "groups" {
  for_each = toset(var.groups)
  name     = each.value
}

resource "aws_iam_user" "users" {
  for_each = toset(var.users)
  name     = each.value
  tags = {
    Env        = "Terraform"
    Managed_By = "Terraform"
  }
}

resource "aws_iam_access_key" "access_keys" {
  for_each = toset(var.users)
  user     = aws_iam_user.users[each.value].name
}

resource "aws_iam_user_login_profile" "console_accesses" {
  for_each                = toset(var.users)
  user                    = aws_iam_user.users[each.value].name
  password_length         = 10
  password_reset_required = true
}

resource "aws_iam_group_membership" "group_membership" {
  count = length(var.groups)
  name  = var.groups[count.index]
  users = [aws_iam_user.users[var.users[count.index]].name, aws_iam_user.users[var.users[count.index + 2]].name]
  group = aws_iam_group.groups[var.groups[count.index]].name
}

resource "aws_iam_group_policy_attachment" "policy_attachment" {
  for_each   = toset(var.groups)
  group      = aws_iam_group.groups[each.value].name
  policy_arn = var.admin_policy_arn
}