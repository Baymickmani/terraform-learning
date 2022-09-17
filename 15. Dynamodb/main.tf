resource "aws_dynamodb_table" "table" {
  hash_key = "LockID"
  name     = "state-locking-table"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}