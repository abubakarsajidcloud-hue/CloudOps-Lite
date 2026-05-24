#!/bin/bash

yum update -y

yum install httpd aws-cli -y

systemctl enable httpd
systemctl start httpd

aws s3 cp s3://cloudops-lite-demo-bucket-12345/index.html /var/www/html/index.html

systemctl restart httpd