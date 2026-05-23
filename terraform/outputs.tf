output "ec2_public_ip" {

  value = aws_instance.cloudops_ec2.public_ip
}


output "s3_bucket_name" {

  value = aws_s3_bucket.cloudops_bucket.bucket
}


output "vpc_id" {

  value = aws_vpc.main_vpc.id
}