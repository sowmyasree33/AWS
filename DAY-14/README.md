# AWS Infrastructure Automation Using Terraform

## Overview

This project demonstrates how to automate AWS infrastructure provisioning using Terraform. The infrastructure is defined as code, allowing resources to be created, modified, and deleted in a consistent and repeatable manner.

## Terraform Basics

### AWS Authentication

Terraform requires AWS credentials to authenticate and interact with AWS services. Credentials can be provided using:

* AWS Access Keys
* IAM Roles
* AWS CLI configured credentials
* Environment Variables
* AWS SSO
  
For this project, AWS credentials were configured to allow Terraform to provision resources in the AWS account.

### Provider

A Provider is a plugin that allows Terraform to interact with a specific platform or service.

Since this project provisions AWS resources, the AWS Provider is used.

Terraform provider documentation can be found in the Terraform Registry.

### Terraform Extension

Install Terraform on your machine and install the HashiCorp Terraform extension in Visual Studio Code for:

* Syntax highlighting
* Auto-completion
* Validation support
* Better Terraform development experience

### Resources

A Resource block defines the infrastructure object that Terraform will create, modify, or manage in AWS.

Examples:

* VPC
* Subnet
* EC2 Instance
* Security Group
* Load Balancer

### Resource Naming

The resource name used inside Terraform is only for Terraform's internal reference.

Example:

```hcl
resource "aws_vpc" "main" {
}
```

Here, `main` is only used by Terraform.

To see a meaningful name in the AWS Console, use a Name tag:

```hcl
tags = {
  Name = "My-VPC"
}
```

---

## Terraform State File

Terraform stores information about managed resources in a state file called:

```text
terraform.tfstate
```

The state file helps Terraform:

* Track existing infrastructure
* Detect changes
* Generate execution plans
* Update only required resources

## Terraform Dependency Management

Terraform automatically builds a dependency graph.

Examples:

* Subnet depends on VPC
* EC2 depends on Subnet
* Route Table Association depends on Route Table and Subnet

Terraform automatically creates resources in the correct order based on these dependencies.

## Variables

Variables allow values to be reused and customized without modifying the Terraform code.

Example:

```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

Benefits:

* Reusability
* Flexibility
* Easier maintenance
  
## Outputs

Outputs display useful information after deployment.

Examples:

* VPC ID
* EC2 Public IP
* Load Balancer DNS Name

Example:

```hcl
output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}
```

---

## Terraform Idempotency

Terraform is idempotent.

If the infrastructure already matches the Terraform configuration, running:

```bash
terraform apply
```

multiple times will not create duplicate resources.

Terraform only makes changes when differences exist between the configuration and the actual infrastructure.

## Subnet Configuration

### map_public_ip_on_launch

```hcl
map_public_ip_on_launch = true
```

When set to `true`, every EC2 instance launched in the subnet automatically receives a public IP address.

This is commonly used for public subnets.

## Route Tables and Routes

A Route Table contains a set of rules called Routes.

A Route tells AWS where network traffic should be directed.

Each Route consists of:

### Destination

The IP address range or network to reach.

Example:

```text
0.0.0.0/0
```

### Target

The resource that traffic should be sent to.

Examples:

* Internet Gateway
* NAT Gateway
* VPC Peering Connection
* Transit Gateway

## Security Groups

A Security Group acts as a virtual firewall for AWS resources.

### Ingress Rules

Ingress means inbound traffic.

Controls traffic entering the resource.

Examples:

* SSH (Port 22)
* HTTP (Port 80)

### Egress Rules

Egress means outbound traffic.

Controls traffic leaving the resource.

## User Data

User Data is a script that runs automatically when an EC2 instance launches.

Common uses:

* Install software packages
* Configure services
* Deploy applications
* Perform server bootstrapping

Example:

```bash
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
```

## IAM Role and Instance Profile

**How can an EC2 instance access S3 securely?**

Steps:

1. Create an IAM Role
2. Attach an S3 access policy to the role
3. Create an Instance Profile
4. Attach the Instance Profile to the EC2 instance
5. EC2 automatically receives temporary credentials
6. No hardcoded AWS access keys are required

This is the recommended and secure approach.

## Networking Concepts

### HTTP

HTTP uses TCP as its transport protocol and by default listens on Port 80.

### SSH

SSH uses TCP Port 22.

SSH is used to securely connect to remote servers for administration and troubleshooting.

### Common Ports

| Port | Service | Purpose                      |
| ---- | ------- | ---------------------------- |
| 22   | SSH     | Secure remote administration |
| 80   | HTTP    | Website access               |

## Application Load Balancer (ALB)

The Application Load Balancer receives requests from users and distributes them across backend resources.

Benefits:

* High Availability
* Fault Tolerance
* Traffic Distribution
* Health Monitoring

## Target Groups

A Target Group is a logical collection of backend targets.

A Target Group can contain:

* One EC2 Instance
* Multiple EC2 Instances
* IP Addresses
* Lambda Functions

One Target Group can contain multiple EC2 instances to provide load balancing and high availability.

A single EC2 instance can belong to multiple Target Groups if it serves different applications or ports.

### Why Not Attach Instances Directly to ALB?

The ALB routes traffic to Target Groups, not directly to EC2 instances.

Target Groups provide:

* Health Checks
* Load Balancing
* Routing Flexibility
* Blue-Green Deployments
* Better Application Management

## Listeners

A Listener checks incoming requests on a specific protocol and port.

It then forwards the requests to the appropriate Target Group.

Example flow:

```text
User Request
      ↓
Application Load Balancer
      ↓
Listener (Port 80)
      ↓
Target Group
      ↓
EC2 Instances
```

### Listener Rules

Listener Rules determine how incoming traffic should be routed.

Examples:

* Route traffic based on URL path
* Route traffic based on hostname
* Forward requests to different Target Groups

## Terraform Commands

### Initialize Terraform

```bash
terraform init
```

Initializes the Terraform working directory and downloads required providers.

### Validate Configuration

```bash
terraform validate
```

Checks Terraform configuration syntax and validates the configuration.

### Format Configuration

```bash
terraform fmt
```

Automatically formats Terraform code according to Terraform style conventions.

### Create Execution Plan

```bash
terraform plan
```

Shows what changes Terraform intends to make without creating resources.

### Apply Infrastructure

```bash
terraform apply
```

Creates or updates infrastructure after confirmation.

### Auto Approve Apply

```bash
terraform apply -auto-approve
```

Creates or updates infrastructure without requiring manual approval.

### Destroy Infrastructure

```bash
terraform destroy
```

Deletes all resources managed by Terraform.

---

## Terraform Workflow

```text
Write Code
    ↓
terraform fmt
    ↓
terraform validate
    ↓
terraform plan
    ↓
terraform apply
    ↓
Infrastructure Created
```

---

## Best Practices Followed

* Used Terraform documentation as the primary reference
* Verified resources using AWS Console
* Used IAM Roles instead of hardcoded credentials where applicable
* Used Security Groups to control traffic
* Used User Data for automated EC2 configuration
* Used ALB and Target Groups for high availability and traffic distribution
* Followed Infrastructure as Code (IaC) principles
