# CloudOps Lite

## Overview

CloudOps Lite is a production-oriented Infrastructure-as-Code (IaC) and cloud operations automation platform built using Terraform, AWS, Bash scripting, and AWS CLI.

The project provisions AWS infrastructure, deploys a web server automatically using EC2 User Data, hosts a dynamic Apache web page, monitors infrastructure health, tracks AWS operational costs, and automates optimization workflows using CLI-driven automation scripts.

CloudOps Lite demonstrates practical DevOps and cloud engineering concepts including:

- Infrastructure as Code (IaC)
- AWS cloud provisioning
- Linux server automation
- EC2 bootstrapping with User Data
- Apache web server deployment
- Monitoring and alerting
- FinOps and cost optimization
- Infrastructure lifecycle automation
- Operational scripting
- Cloud observability workflows

The platform simulates real-world cloud operations engineering practices used in modern DevOps environments.

---

# Architecture

The project follows a modular cloud operations workflow where infrastructure provisioning, server automation, monitoring, and optimization are integrated into a unified platform.

Architecture Flow:

```text
Developer
   ↓
GitHub Repository
   ↓
Bash Automation Scripts
   ↓
Terraform Infrastructure
   ↓
AWS Cloud Resources
   ↓
EC2 User Data Bootstrap
   ↓
Apache Web Server Deployment
   ↓
CloudWatch Monitoring
   ↓
Cost Tracking & Optimization
   ↓
Automated Reporting
```

---

# Provisioned Infrastructure

CloudOps Lite provisions the following AWS resources:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance
- Apache Web Server
- S3 Bucket
- IAM Role
- IAM Instance Profile
- CloudWatch Alarm
- SNS Alert Topic

---

# AWS Services Used

## Amazon EC2

Used to provision the Linux compute instance that hosts the Apache web server and operational monitoring environment.

---

## Amazon VPC

Used to create an isolated virtual cloud network with custom networking configuration.

Features include:

- Public subnet
- Internet connectivity
- Route tables
- Security isolation

---

## Amazon S3

Used for:

- Report storage
- Future Terraform remote backend support
- Infrastructure artifact storage

---

## AWS IAM

Used to create secure permissions and roles for EC2 and monitoring services.

---

## Amazon CloudWatch

Used for:

- CPU utilization monitoring
- Infrastructure health tracking
- CloudWatch alarms
- Operational observability

---

## Amazon SNS

Used to send automated infrastructure and monitoring alerts.

---

## AWS Cost Explorer

Used for:

- Cost monitoring
- Service-level spending analysis
- Cost forecasting
- FinOps reporting

---

# Apache Web Server Automation

CloudOps Lite automatically installs and configures the Apache web server during EC2 instance provisioning using a Terraform User Data script.

The automation workflow:

```text
EC2 Launch
   ↓
userdata.sh executes automatically
   ↓
Apache installed
   ↓
Apache service started
   ↓
Apache enabled on boot
   ↓
index.html deployed
   ↓
Web server becomes publicly accessible
```

---

# User Data Bootstrap

The project includes:

## userdata.sh

Automates EC2 instance configuration during launch.

Functions include:

- System package updates
- Apache installation
- Apache service startup
- Service auto-enable on reboot
- Deployment of custom web page

Example workflow:

```bash
#!/bin/bash

yum update -y
yum install httpd -y

systemctl start httpd
systemctl enable httpd

cp /tmp/index.html /var/www/html/index.html
```

---

## index.html

Custom Apache landing page deployed automatically during infrastructure provisioning.

The page demonstrates:

- Successful deployment
- Apache configuration
- Infrastructure automation
- CloudOps Lite branding

---

# Terraform Infrastructure

Terraform is used as the Infrastructure-as-Code tool for provisioning AWS resources.

Terraform workflow:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

---

# Terraform Files

## provider.tf

Configures:

- AWS provider
- AWS region
- Provider settings

---

## variables.tf

Stores reusable variables including:

- AWS region
- Instance type
- Bucket name
- AMI ID
- Key pair
- Tags

---

## vpc.tf

Creates:

- VPC
- Public subnet
- Internet gateway
- Route table
- Route association

---

## ec2.tf

Creates:

- EC2 instance
- Security group
- Public networking rules
- User Data integration
- Apache server deployment

---

## userdata.sh

Bootstraps the EC2 instance automatically during launch.

Installs and configures:

- Apache HTTP Server
- Web application page

---

## index.html

Custom landing page hosted by the Apache server.

---

## s3.tf

Creates:

- S3 bucket for reports and storage

---

## iam.tf

Creates:

- IAM role
- IAM policy attachment
- EC2 instance profile

---

## cloudwatch.tf

Creates:

- CloudWatch CPU utilization alarm
- Monitoring alerts

---

## sns.tf

Creates:

- SNS alert topic
- Notification system

---

## outputs.tf

Displays outputs including:

- EC2 public IP
- Website URL
- VPC ID
- S3 bucket name

---

# Monitoring System

CloudOps Lite includes an automated monitoring system using CloudWatch metrics and Bash scripts.

Monitoring capabilities:

- CPU utilization tracking
- EC2 health monitoring
- Infrastructure status checks
- Network monitoring
- CloudWatch metric retrieval

Run monitoring workflow:

```bash
./monitor.sh
```

Example output:

```text
CloudOps Monitoring Report

CPU Usage: 31%
Status: Healthy
Apache Server: Running
```

The monitoring scripts retrieve CloudWatch metrics using AWS CLI commands and display operational infrastructure health information in real time.

---

# Cost Optimization

CloudOps Lite includes FinOps-focused operational cost tracking using AWS Cost Explorer.

Features include:

- Monthly AWS spending analysis
- Cost forecasting
- Service-level breakdown
- Infrastructure usage monitoring
- Idle resource detection

Run cost report:

```bash
./cost-report.sh
```

Example output:

```text
Current Month Cost

EC2: $4.50
S3: $1.20

Forecast:
$8.40
```

---

# Idle Resource Optimization

CloudOps Lite automatically detects low-utilization EC2 instances and shuts them down to reduce operational costs.

Optimization Logic:

```text
CPU Usage < 5%
for 2 hours
→ Stop EC2 Instance
```

This workflow demonstrates practical FinOps and cloud cost optimization strategies used in production cloud operations.

---

# Automation Scripts

The platform uses Bash automation scripts for infrastructure operations.

---

## deploy.sh

Automates Terraform deployment workflow.

Functions:

- terraform fmt
- terraform validate
- terraform init
- terraform plan
- terraform apply

Run:

```bash
./deploy.sh
```

---

## monitor.sh

Retrieves:

- CloudWatch metrics
- Infrastructure health
- Apache server status

Run:

```bash
./monitor.sh
```

---

## cost-report.sh

Generates AWS cost and usage reports using AWS Cost Explorer.

Run:

```bash
./cost-report.sh
```

---

## shutdown-idle.sh

Detects and shuts down idle EC2 instances automatically.

Run:

```bash
./shutdown-idle.sh
```

---

## report.sh

Generates operational infrastructure reports and stores them in the reports directory.

Run:

```bash
./report.sh
```

---

## destroy.sh

Safely destroys all Terraform-managed infrastructure resources.

Run:

```bash
./destroy.sh
```

---

# Setup Guide

## Prerequisites

Install:

- AWS CLI
- Terraform
- Git

---

## Configure AWS CLI

```bash
aws configure
```

Provide:

- AWS Access Key
- AWS Secret Access Key
- AWS Region
- Output format

Example region:

```text
sa-east-1
```

---

# Clone Repository

```bash
git clone YOUR_REPOSITORY_URL

cd cloudops-lite
```

---

# Initialize Terraform

```bash
cd terraform

terraform init
```

---

# Validate Infrastructure

```bash
terraform validate
```

---

# Deployment Steps

## Step 1 — Deploy Infrastructure

```bash
cd scripts

./deploy.sh
```

---

## Step 2 — Access Apache Web Server

Open the EC2 public IP in a browser:

```text
http://EC2_PUBLIC_IP
```

The custom `index.html` page should load automatically.

---

## Step 3 — Monitor Infrastructure

```bash
./monitor.sh
```

---

## Step 4 — Track Cloud Cost

```bash
./cost-report.sh
```

---

## Step 5 — Run Optimization Workflow

```bash
./shutdown-idle.sh
```

---

## Step 6 — Generate Reports

```bash
./report.sh
```

---

## Step 7 — Destroy Infrastructure

```bash
./destroy.sh
```

---

# Screenshots

The project includes screenshots demonstrating:

- Terraform deployment
- EC2 dashboard
- VPC configuration
- Apache web server
- Browser output
- CloudWatch metrics
- SNS alerts
- Cost Explorer dashboard
- Monitoring scripts
- Optimization workflow

Screenshots are stored inside:

```text
docs/screenshots/
```

---

# Lessons Learned

This project provided practical experience with:

- Infrastructure as Code
- Terraform workflows
- AWS infrastructure provisioning
- Linux server automation
- EC2 bootstrapping
- Apache web server deployment
- Cloud monitoring systems
- FinOps and cost optimization
- Bash automation scripting
- AWS CLI operations
- Infrastructure lifecycle management
- Operational alerting
- Production-oriented cloud operations workflows

The project significantly improved understanding of real-world DevOps and cloud engineering practices.

---

# Future Improvements

Planned future enhancements:

- Multi-environment Terraform support
- Terraform remote backend using S3
- DynamoDB state locking
- Auto Scaling Groups
- Application Load Balancer
- Advanced CloudWatch dashboards
- Lambda-based optimization workflows
- Slack/email alert integrations
- Dockerized monitoring tools
- GitHub Actions CI/CD integration
- Kubernetes monitoring
- Centralized logging with CloudWatch Logs
- Security scanning automation
- Infrastructure compliance validation

---

# Project Structure

```text
cloudops-lite/
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── vpc.tf
│   ├── ec2.tf
│   ├── s3.tf
│   ├── iam.tf
│   ├── cloudwatch.tf
│   ├── sns.tf
│   ├── userdata.sh
│   └── index.html
│
├── scripts/
│   ├── deploy.sh
│   ├── monitor.sh
│   ├── cost-report.sh
│   ├── shutdown-idle.sh
│   ├── report.sh
│   └── destroy.sh
│
├── reports/
│
├── docs/
│   ├── architecture.png
│   └── screenshots/
│
├── .gitignore
├── README.md
└── LICENSE
```

---

# Conclusion

CloudOps Lite is a practical cloud operations and infrastructure automation platform designed to demonstrate real-world DevOps and cloud engineering capabilities.

The project combines:

- Terraform Infrastructure as Code
- AWS cloud services
- Linux automation
- Apache server deployment
- Monitoring systems
- FinOps practices
- Cloud optimization workflows
- Bash operational scripting

into a production-oriented cloud operations platform suitable for:

- DevOps portfolios
- Cloud engineering portfolios
- Infrastructure engineering portfolios
- Internship demonstrations
- Real-world AWS operations learning

The project reflects modern operational engineering practices used in cloud-native environments.