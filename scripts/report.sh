#!/bin/bash

mkdir -p ../reports

REPORT=../reports/cloud-report.txt

echo "CloudOps Lite Report" > $REPORT

echo "Generated on: $(date)" >> $REPORT

echo "" >> $REPORT

echo "EC2 Instances:" >> $REPORT

aws ec2 describe-instances \
--query "Reservations[*].Instances[*].InstanceId" \
--output text >> $REPORT

echo "" >> $REPORT

echo "S3 Buckets:" >> $REPORT

aws s3 ls >> $REPORT

echo "" >> $REPORT

echo "Report Generated Successfully!"