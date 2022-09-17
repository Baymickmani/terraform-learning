terraform {
  backend "s3" {
    bucket         = "remotestatebucket34323432"
    key            = "ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-locking-table"
  }
}