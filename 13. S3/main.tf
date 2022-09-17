resource "aws_s3_bucket" "bucket_via_terraform" {
  bucket = "remotestatebucket34323432"
  force_destroy = true
  tags = {
    "createdBy" = "Terraform"
    "managedBy" = "Automation"
  }
}