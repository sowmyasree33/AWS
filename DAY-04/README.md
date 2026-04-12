# AWS Production Architecture Project

## Overview

This project demonstrates a secure and scalable AWS architecture using VPC, public and private subnets, Bastion Host, NAT Gateway, Application Load Balancer, and EC2 instances.

## Architecture

1. VPC with CIDR block
2. Public and Private Subnets across multiple AZs
3. Internet Gateway for public access
4.  NAT Gateway for private subnet outbound access
5.  Bastion Host for secure SSH access
6.  Private EC2 instances running Apache Web Server
7.  Application Load Balancer for distributing traffic

## Request Flow

User → Internet → ALB → Target Group → Private EC2 → Apache → Response

## Security Features

1. No direct access to private EC2
2. Bastion host used for SSH
3. Security groups restrict traffic
4. Private subnet isolation

## Steps Performed

1. Created VPC with public and private subnets
2. Configured Internet Gateway and NAT Gateway
3. Created Bastion Host in public subnet
4. Connected to private EC2 using SSH via Bastion in MobaXterm terminal
5. Installed Apache web server
6. Created HTML page using vim command 
7. Created Target Group and registered EC2 instances
8. Created Application Load Balancer
9. Accessed application using ALB DNS

## Key Learnings

1. Difference between public and private subnets
2. Importance of Bastion host
3. NAT Gateway usage
4. Load balancing with ALB
5. SSH key handling and permissions

This project helped me understand real-world AWS production architecture.
