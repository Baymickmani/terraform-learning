terraform {
  backend "s3" {
    bucket         = "remotestatebucket34323432"
    key            = "training/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-locking-table"
  }
}