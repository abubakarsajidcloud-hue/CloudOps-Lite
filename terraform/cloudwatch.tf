resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name = "cloudops-high-cpu"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 120

  statistic = "Average"

  threshold = 80

  alarm_description = "High CPU usage detected"

  dimensions = {
    InstanceId = aws_instance.cloudops_ec2.id
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]
}