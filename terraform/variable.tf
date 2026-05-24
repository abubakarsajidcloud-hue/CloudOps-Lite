variable "aws_region" {
  default = "sa-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "cloudops-ec2"
}

variable "bucket_name" {
  default = "cloudops-lite-demo-bucket-12345"
}

variable "ami_id" {
  default = "ami-06930b0cd4de115a5"
}