resource "aws_s3_bucket" "cloudops_bucket" {

  bucket = var.bucket_name

  tags = {
    Name = "cloudops-lite-bucket"
  }
}