# AWS Cloud Migration

## Overview

Cloud Migration is the process of moving applications, databases, servers, and other workloads from an on-premises environment or another cloud platform to AWS.

A typical cloud migration project follows five major stages:

1. Preparation
2. Planning
3. Migration
4. Monitoring
5. Optimization

# Cloud Migration Lifecycle

## Stage 1 - Preparation

The preparation phase focuses on understanding the current environment and defining migration goals.

Activities include:

- Application discovery
- Dependency mapping
- Infrastructure assessment
- Security assessment
- Compliance review
- Cost analysis
- Business requirement gathering

Organizations may have:

- A Monolithic Application
- Multiple Microservices

### Monolithic Architecture

A monolithic application is a software application where all components are built, deployed, and managed as a single unit.

Examples of components inside a monolithic application:

- Authentication
- Orders
- Payments
- Notifications

All components share the same codebase and deployment process.

During migration, organizations may decide to:

- Keep the monolithic architecture
- Rehost the application
- Replatform the application
- Refactor the application into microservices

## Stage 2 - Planning

The planning phase determines:

- Which applications will be migrated
- Migration order
- Migration waves/phases
- Migration strategy
- Target AWS services

### Example

Suppose an organization has 200 applications.

Applications may be grouped as:

| Phase | Type |
|---------|---------|
| Phase 1 | Low-risk / Non-critical |
| Phase 2 | Low-Medium Critical |
| Phase 3 | Medium Critical |
| Phase 4 | High Critical |
| Phase 5 | Mission Critical |

Critical applications are typically migrated later after earlier phases have been validated successfully.

# The 7 Rs of Cloud Migration

AWS identifies seven common migration strategies.

## 1. Rehost (Lift and Shift)

Move applications to AWS with minimal or no changes.

Examples:

- Physical Server → Amazon EC2
- VMware VM → Amazon EC2

Advantages:

- Fast migration
- Low risk
- Minimal modifications

## 2. Replatform (Lift, Tinker and Shift)

Make limited optimizations while migrating without changing the application's core architecture.

Examples:

- Self-managed MySQL → Amazon RDS
- Self-managed Redis → Amazon ElastiCache
- Traditional deployment → Amazon ECS

Advantages:

- Better operational efficiency
- Reduced management overhead

## 3. Refactor / Re-Architect

Redesign the application to take advantage of cloud-native services.

Examples:

- Monolith → Microservices
- VM-based Application → Containers and Serverless

AWS Services:

- Amazon ECS
- Amazon EKS
- AWS Lambda
- Amazon API Gateway

Advantages:

- Improved scalability
- Higher availability
- Better performance

## 4. Repurchase

Replace an existing application with a SaaS solution.

Examples:

- On-Prem CRM → Salesforce
- On-Prem Email Server → Microsoft 365

Also known as:

**Drop and Shop**

## 5. Relocate

Move workloads to AWS without redesigning applications.

Example:

- VMware vSphere → VMware Cloud on AWS

Advantages:

- Minimal changes
- Faster migration

## 6. Retain

Keep certain applications on-premises.

Reasons:

- Regulatory requirements
- Security concerns
- Technical limitations
- High migration cost

Example:

A banking organization may keep customer-sensitive applications on-premises while other workloads run in AWS.

## 7. Retire

Decommission applications that are no longer required.

Benefits:

- Reduced cost
- Reduced maintenance effort
- Simplified infrastructure

# Stage 3 - Migration

Applications are migrated according to the planned phases.

Migration may include:

- Applications
- Databases
- File Systems
- Virtual Machines

AWS Services commonly used:

- AWS Application Migration Service (MGN)
- AWS Database Migration Service (DMS)
- AWS Migration Hub
- AWS DataSync
- AWS Snow Family

# Database Migration

Database migration involves more than simply copying data.

Typical steps:

1. Select the appropriate AWS database service.
2. Perform schema conversion if required.
3. Migrate data.
4. Validate migrated data.
5. Perform production cutover.

Examples:

| Source Database | AWS Target Service |
|-----------------|-------------------|
| MySQL | Amazon RDS MySQL |
| PostgreSQL | Amazon RDS PostgreSQL |
| SQL Server | Amazon RDS SQL Server |
| Oracle | Amazon RDS Oracle |
| MongoDB | Amazon DocumentDB |

AWS Service:

- AWS Database Migration Service (DMS)

# Stage 4 - Monitoring

After migration, workloads are monitored to ensure:

- Availability
- Performance
- Security
- Reliability

AWS Services:

- Amazon CloudWatch
- AWS CloudTrail
- AWS Config
- AWS X-Ray

Organizations typically monitor migrated workloads before proceeding to the next migration phase.

# Stage 5 - Optimization

After successful migration, workloads are optimized to improve:

- Cost
- Performance
- Security
- Scalability

Optimization activities include:

- Rightsizing EC2 instances
- Implementing Auto Scaling
- Purchasing Reserved Instances
- Using Savings Plans
- Security hardening
- Performance tuning

# Key Takeaways

- Cloud migration follows Preparation → Planning → Migration → Monitoring → Optimization.
- Not every application needs to be refactored into microservices.
- The 7 Rs help determine the most suitable migration approach.
- AWS provides dedicated services such as MGN, DMS, Migration Hub, and DataSync to simplify migration.
- Monitoring and optimization are critical for long-term success after migration.
