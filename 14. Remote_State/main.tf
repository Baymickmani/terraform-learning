resource "aws_s3_bucket" "remotebucket" {
  bucket        = "bucketcreatedwithremotebackend23234"
  force_destroy = true
  tags = {
    "createdBy" = "Terraform"
    "managedBy" = "Automation"
  }
}

resource "aws_s3_object" "remoteobject" {
  bucket = aws_s3_bucket.remotebucket.bucket
  key    = "balaji.jpg"
  source = "C:/Users/harik/Downloads/balaji.png"
}