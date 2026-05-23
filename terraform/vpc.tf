# VPC

resource "aws_vpc" "main_vpc" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cloudops-vpc"
  }
}


# PUBLIC SUBNET

resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.main_vpc.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "sa-east-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "cloudops-public-subnet"
  }
}


# INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "cloudops-igw"
  }
}


# ROUTE TABLE

resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.main_vpc.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "cloudops-public-rt"
  }
}


# ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "public_assoc" {

  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_rt.id
}