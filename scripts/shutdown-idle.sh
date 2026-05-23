#!/bin/bash

INSTANCE_ID=$(aws ec2 describe-instances \
--query "Reservations[*].Instances[*].InstanceId" \
--output text)

CPU=$(aws cloudwatch get-metric-statistics \
--namespace AWS/EC2 \
--metric-name CPUUtilization \
--dimensions Name=InstanceId,Value=$INSTANCE_ID \
--statistics Average \
--period 300 \
--start-time $(date -u -d '2 hours ago' +%FT%TZ) \
--end-time $(date -u +%FT%TZ) \
--query 'Datapoints[0].Average' \
--output text)

echo "CPU Usage: $CPU"

CPU_INT=${CPU%.*}

if [ "$CPU_INT" -lt 5 ]; then

    echo "Idle instance detected."

    aws ec2 stop-instances --instance-ids $INSTANCE_ID

    echo "EC2 instance stopped."

else

    echo "Instance is active."

fi