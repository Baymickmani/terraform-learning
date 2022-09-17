# output "access_key_ids" {
#   for_each = toset(var.users)
#   value    = "${each.value} - ${aws_iam_access_key.access_key[each.value].id}"
# }

# output "access_key_secret" {
#     value = aws_iam_access_key.access_key.secret
#     sensitive = true
# }

# output "password" {
#     value = aws_iam_user_login_profile.console_access.password
# }