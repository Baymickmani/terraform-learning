module "Prod" {
    source = "../Child Modules"
    name = "prod_table"
    billing_mode = "PAY_PER_REQUEST"
    primary_key = "prod_id"
    primary_key_type = "N"
}