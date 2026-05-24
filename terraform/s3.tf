resource "aws_s3_bucket" "cloudops_bucket" {

  bucket = var.bucket_name

  tags = {
    Name = "cloudops-lite-bucket"
  }
}



# WEBSITE FILE UPLOAD

resource "aws_s3_object" "website_file" {

  bucket = aws_s3_bucket.cloudops_bucket.bucket

  key = "index.html"

  source = "../website/index.html"

  content_type = "text/html"
}