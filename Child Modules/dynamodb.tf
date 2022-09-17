resource "aws_dynamodb_table" "table" {
    name = "${var.name}_dynamo_db_table"
    hash_key = var.primary_key
    attribute {
      name = var.primary_key
      type = var.primary_key_type
    }
    billing_mode = var.billing_mode
    read_capacity = var.billing_mode == "PROVISIONED" ? 5 : 0
    write_capacity = var.billing_mode == "PROVISIONED" ? 5 : 0
}