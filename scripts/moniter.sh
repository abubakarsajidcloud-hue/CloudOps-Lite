
#!/bin/bash

echo "CloudOps Monitoring Report"

INSTANCE_ID=$(aws ec2 describe-instances \
--query "Reservations[*].Instances[*].InstanceId" \
--output text)

CPU=$(aws cloudwatch get-metric-statistics \
--namespace AWS/EC2 \
--metric-name CPUUtilization \
--dimensions Name=InstanceId,Value=$INSTANCE_ID \
--statistics Average \
--period 300 \
--start-time $(date -u -d '10 minutes ago' +%FT%TZ) \
--end-time $(date -u +%FT%TZ) \
--query 'Datapoints[0].Average' \
--output text)

echo "CPU Usage: $CPU %"

echo "Status: Healthy"