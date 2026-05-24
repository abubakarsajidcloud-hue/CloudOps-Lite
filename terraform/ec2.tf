# SECURITY GROUP

resource "aws_security_group" "ec2_sg" {

  name = "cloudops-security-group"

  description = "Allow SSH and HTTP"

  vpc_id = aws_vpc.main_vpc.id


  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "cloudops-sg"
  }
}



# EC2 INSTANCE

resource "aws_instance" "cloudops_ec2" {

  ami = var.ami_id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  associate_public_ip_address = true


  # AUTO WEBSITE DEPLOYMENT

 user_data = file("userdata.sh")


  tags = {
    Name = var.instance_name
  }
}