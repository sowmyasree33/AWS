# AWS Cloud Cost Optimization Using Lambda

## Overview

One of the major reasons organizations move to AWS is to reduce infrastructure management overhead and optimize operational costs.

Cloud environments often accumulate unused resources that continue generating charges. These unused resources are called **stale resources**.

Examples:

- Unattached EBS volumes
- Old EBS snapshots
- Unused S3 buckets
- Idle EC2 instances
- Unused Elastic IPs
- Old RDS snapshots

Identifying and removing stale resources is an important responsibility of DevOps engineers.

## Problem Statement

EXample: Developers often create EBS snapshots for backup purposes.

Over time:

### Scenario 1

- EC2 instance is deleted
- EBS volume still exists
- Snapshots still exist

### Scenario 2

- EC2 instance is deleted
- EBS volume is deleted
- Snapshots still exist

In both scenarios, snapshots may continue generating storage costs.

A business should periodically review snapshots and delete those that are no longer required according to retention policies.

## Solution Architecture

### Services Used

- AWS Lambda
- Amazon EventBridge (Scheduled Trigger)
- Amazon EC2 APIs
- Boto3 SDK

### Workflow

1. EventBridge triggers Lambda on a schedule.
2. Lambda uses Boto3 to communicate with AWS APIs.
3. Lambda fetches all EBS snapshots.
4. Lambda checks whether the associated volume exists.
5. Lambda verifies whether the volume is attached to a running EC2 instance.
6. Snapshots identified as stale are deleted (based on business rules).

## Why Lambda?

AWS Lambda is a serverless compute service.

Benefits:

- No server management
- Pay only for usage
- Easy integration with AWS services
- Supports Python and Boto3 SDK

Lambda pricing depends on:

- Number of requests
- Execution duration
- Memory allocation

Default Lambda timeout: **3 seconds**

Timeout can be increased if required.

## Boto3

Boto3 is the AWS SDK for Python.

It enables Python applications to interact with AWS services.

Example operations:

- Describe snapshots
- Describe volumes
- Describe instances
- Delete snapshots
