variable "groups" {
  type    = list(string)
  default = ["group1", "group2"]
}

variable "users" {
  type    = list(string)
  default = ["user1", "user2", "user3", "user4"]
}

variable "admin_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}