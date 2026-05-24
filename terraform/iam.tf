# IAM ROLE

resource "aws_iam_role" "ec2_role" {

  name = "cloudops-ec2-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Action = "sts:AssumeRole"

        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

      }

    ]
  })
}


# CLOUDWATCH POLICY

resource "aws_iam_role_policy_attachment" "cloudwatch_attach" {

  role = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}


# S3 READ ACCESS

resource "aws_iam_role_policy_attachment" "s3_readonly_attach" {

  role = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}


# INSTANCE PROFILE

resource "aws_iam_instance_profile" "ec2_profile" {

  name = "cloudops-ec2-profile"

  role = aws_iam_role.ec2_role.name
}