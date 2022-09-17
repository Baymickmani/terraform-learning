resource "aws_dynamodb_table" "table" {
    name = "terraform_table"
    hash_key = "terraform_id"
    attribute {
      name = "terraform_id"
      type = "N"
    }
    billing_mode = "PAY_PER_REQUEST"
}