# CloudOps Lite

## Overview

CloudOps Lite is an Infrastructure-as-Code (IaC) and cloud operations automation project built using Terraform, AWS, Bash scripting, and AWS CLI. The platform provisions AWS infrastructure, monitors cloud resources, tracks operational costs, and performs automated optimization of idle resources through CLI-driven workflows.

The project focuses on practical cloud operations engineering by combining infrastructure provisioning, monitoring, cost management, and automation into a single operational platform.

CloudOps Lite demonstrates real-world DevOps and cloud engineering concepts including Infrastructure as Code, monitoring automation, FinOps practices, AWS cloud services management, and operational scripting.

---

# Architecture

The project architecture follows a modular cloud operations workflow.

Developer commands are executed through Bash automation scripts, which interact with Terraform and AWS CLI to provision and manage AWS infrastructure resources.

Architecture Flow:

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
CloudWatch Monitoring
↓
Cost Tracking & Optimization
↓
Automated Reporting

Provisioned Infrastructure:

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Security Group
* EC2 Instance
* S3 Bucket
* IAM Role
* CloudWatch Alarm
* SNS Alert Topic

---

# AWS Services Used

## Amazon EC2

Used to provision and manage the compute instance for cloud operations monitoring and optimization.

## Amazon VPC

Used to create an isolated virtual network environment including public subnet configuration and routing.

## Amazon S3

Used for cloud storage, report storage, and future Terraform remote backend support.

## AWS IAM

Used to create roles and permissions for EC2 instances and CloudWatch monitoring.

## Amazon CloudWatch

Used for infrastructure monitoring, CPU utilization tracking, and operational health metrics.

## AWS SNS

Used for sending automated alert notifications during optimization workflows.

## AWS Cost Explorer

Used to monitor AWS spending, generate cost reports, and forecast operational costs.

---

# Terraform Infrastructure

Terraform is used as the Infrastructure-as-Code tool for provisioning AWS resources.

The Terraform workflow includes:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

Infrastructure Modules:

## provider.tf

Configures the AWS provider and region settings.

## variables.tf

Stores reusable infrastructure variables such as region, instance type, bucket name, and AMI ID.

## vpc.tf

Creates:

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Association

## ec2.tf

Creates:

* EC2 instance
* Security Group
* Public networking rules

## s3.tf

Creates:

* S3 bucket for storage and reporting

## iam.tf

Creates:

* IAM role
* IAM policy attachment
* EC2 instance profile

## cloudwatch.tf

Creates:

* CloudWatch metric alarm for CPU monitoring

## sns.tf

Creates:

* SNS alert topic for operational notifications

## outputs.tf

Displays infrastructure outputs such as:

* EC2 public IP
* VPC ID
* S3 bucket name

---

# Monitoring System

CloudOps Lite includes an automated monitoring system using CloudWatch metrics and Bash scripts.

Monitoring features include:

* CPU utilization tracking
* Instance health monitoring
* Network monitoring
* Infrastructure status checks

Monitoring Command:

```bash
./monitor.sh
```

Example Output:

```text
CloudOps Monitoring Report

CPU Usage: 31%
Status: Healthy
```

The monitoring workflow retrieves CloudWatch metrics using AWS CLI commands and displays infrastructure health information in real time.

---

# Cost Optimization

CloudOps Lite includes FinOps-focused operational cost tracking using AWS Cost Explorer.

Cost tracking features include:

* Monthly AWS spending
* Service-level cost breakdown
* Cost forecasting
* Usage monitoring

Cost Report Command:

```bash
./cost-report.sh
```

Example Output:

```text
Current Month Cost

EC2: $4.50
S3: $1.20

Forecast:
$8.40
```

The project demonstrates practical cost-awareness strategies used in real cloud operations environments.

---

# Automation Scripts

The platform uses Bash scripts to automate cloud operations workflows.

## deploy.sh

Automates Terraform deployment workflow.

Functions:

* terraform fmt
* terraform validate
* terraform plan
* terraform apply

---

## monitor.sh

Retrieves CloudWatch monitoring metrics and infrastructure health information.

---

## cost-report.sh

Generates AWS cost and usage reports using AWS Cost Explorer.

---

## shutdown-idle.sh

Automatically detects idle EC2 instances and shuts them down to reduce operational costs.

Optimization Logic:

```text
CPU Usage < 5%
for 2 hours
→ Stop EC2 Instance
```

---

## report.sh

Generates operational infrastructure reports and stores them inside the reports directory.

---

## destroy.sh

Safely destroys AWS infrastructure resources using Terraform.

---

# Setup Guide

## Prerequisites

Install the following tools:

* AWS CLI
* Terraform
* Git

Configure AWS CLI:

```bash
aws configure
```

Provide:

* AWS Access Key
* AWS Secret Key
* AWS Region
* Output format

---

## Clone Repository

```bash
git clone YOUR_REPOSITORY_URL
cd cloudops-lite
```

---

## Initialize Terraform

```bash
cd terraform

terraform init
```

---

## Validate Infrastructure

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

## Step 2 — Monitor Infrastructure

```bash
./monitor.sh
```

---

## Step 3 — Track Cloud Cost

```bash
./cost-report.sh
```

---

## Step 4 — Run Optimization

```bash
./shutdown-idle.sh
```

---

## Step 5 — Generate Reports

```bash
./report.sh
```

---

## Step 6 — Destroy Infrastructure

```bash
./destroy.sh
```

---

# Screenshots

The project includes screenshots demonstrating:

* Terraform deployment
* AWS EC2 dashboard
* VPC configuration
* CloudWatch metrics
* Cost Explorer dashboard
* Monitoring script output
* Cost report output
* Optimization workflow

Screenshots are stored inside:

```text
docs/screenshots/
```

---

# Lessons Learned

This project provided practical experience with:

* Infrastructure as Code
* Terraform workflows
* AWS cloud infrastructure
* Cloud monitoring systems
* FinOps and cost optimization
* Bash automation scripting
* AWS CLI operations
* Infrastructure lifecycle management
* Operational alerting
* Cloud automation best practices

The project also improved understanding of production-oriented cloud operations engineering concepts.

---

# Future Improvements

Future enhancements planned for CloudOps Lite include:

* Multi-environment Terraform support
* Terraform remote backend using S3
* DynamoDB state locking
* Advanced CloudWatch dashboards
* Auto-scaling integration
* Lambda-based optimization workflows
* Slack or email alert integrations
* Kubernetes monitoring support
* Dockerized monitoring tools
* CI/CD integration with GitHub Actions
* Centralized logging using CloudWatch Logs
* Infrastructure security scanning

---

# Project Structure

```text
cloudops-lite/
│
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── vpc.tf
│   ├── ec2.tf
│   ├── s3.tf
│   ├── iam.tf
│   ├── cloudwatch.tf
│   └── sns.tf
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

The project combines Terraform, AWS cloud services, monitoring systems, FinOps practices, and automation scripting into a production-oriented cloud operations workflow suitable for DevOps, Cloud Engineering, and Infrastructure Engineering portfolios.
