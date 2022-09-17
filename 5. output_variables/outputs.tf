output "passwordForMyRDS" {
    value = random_password.password.result
    sensitive = true
}