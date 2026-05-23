# Reports

CloudOps Lite includes an automated reporting system that generates infrastructure and operational summaries using AWS CLI and Bash automation scripts.

The reporting system helps visualize the current cloud environment, operational health, and infrastructure resources in a centralized format.

Generated reports are stored inside the `reports/` directory.

Directory:

```text
reports/
```

---

## Report Generation

Run the reporting script:

```bash
./report.sh
```

The script automatically collects:

* EC2 instance information
* S3 bucket details
* Infrastructure summary
* Monitoring status
* Operational metadata

The report is generated and saved as:

```text
reports/cloud-report.txt
```

---

## Example Report Output

```text
CloudOps Lite Report

Generated on:
Sat May 23 2026

Infrastructure Summary
----------------------

EC2 Instances:
i-0abc123def456

S3 Buckets:
cloudops-lite-demo-bucket

Monitoring Status:
Healthy

Optimization Suggestions:
No idle resources detected
```

---

## Purpose of Reporting System

The reporting feature demonstrates operational automation practices commonly used in production cloud environments.

Benefits include:

* Infrastructure visibility
* Operational tracking
* Environment documentation
* Automation workflows
* Audit-friendly reporting
* Cloud operations management

The reporting system also improves the project's realism by simulating practical cloud operations engineering workflows.
