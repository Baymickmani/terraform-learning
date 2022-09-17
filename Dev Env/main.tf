module "Dev" {
    source = "../Child Modules"
    name = "dev_table"
    billing_mode = "PROVISIONED"
    primary_key = "dev_id"
    primary_key_type = "S"
}