# AWS Config - Custom Compliance Rule using Lambda

## Overview

AWS Config is a governance and compliance service that helps organizations assess, audit, and evaluate the configurations of AWS resources. It continuously monitors AWS resources and determines whether they comply with organizational policies and standards.

Organizations often define compliance requirements such as:

* Mandatory resource tags
* Encryption requirements
* Security group restrictions
* IAM policy standards
* Monitoring and logging requirements

AWS Config helps DevOps and Cloud Engineers ensure that AWS resources adhere to these standards.

## Project Objective

I implemented a custom AWS Config rule using AWS Lambda to verify whether EC2 instances contain mandatory organizational tags.

### Mandatory Tags

The following tags were defined as mandatory:

* Owner
* Environment
* Project

Any EC2 instance missing one or more of these tags is marked as **NON_COMPLIANT**.

Any EC2 instance containing all required tags is marked as **COMPLIANT**.

## Services Used

* AWS Config
* AWS Lambda
* Amazon EC2
* IAM
* Amazon S3
* Amazon CloudWatch

## Architecture

```text
EC2 Instance
      |
      v
AWS Config Records Configuration Changes
      |
      v
Custom AWS Config Rule
      |
      v
AWS Lambda Function
      |
      v
Checks Required Tags
      |
      +----> COMPLIANT
      |
      +----> NON_COMPLIANT
```

## Implementation Steps

### Step 1: Create EC2 Instance

Created an EC2 instance and intentionally added only some of the required tags.

Example:

```text
Owner = Sowmya
```

Missing tags:

```text
Environment
Project
```

This was done to test the compliance rule.

### Step 2: Configure AWS Config

Configured AWS Config with:

* Configuration Recorder
* Delivery Channel (Amazon S3)
* Continuous Recording

AWS Config records configuration changes for supported AWS resources.

### Step 3: Create IAM Role for Lambda

Created an IAM role and attached:

* AWSLambdaBasicExecutionRole
* AmazonEC2ReadOnlyAccess

These permissions allow Lambda to write logs to CloudWatch and access EC2 resource information.

### Step 4: Create Lambda Function

Created a Lambda function named:

```text
EC2TagComplianceCheck
```

The Lambda function checks whether the following tags exist on the EC2 instance:

```python
REQUIRED_TAGS = ["Owner", "Environment", "Project"]
```

If any tag is missing, the resource is marked as NON_COMPLIANT.

If all tags are present, the resource is marked as COMPLIANT.

### Step 5: Create Custom AWS Config Rule

Created a custom AWS Config rule and associated it with the Lambda function.

Configuration:

* Evaluation Mode: Detective
* Trigger Type: Configuration Changes
* Resource Type: EC2 Instance

Whenever an EC2 instance is created or modified, AWS Config invokes the Lambda function for evaluation.

### Step 6: Validate Compliance

#### Non-Compliant Scenario

EC2 Instance Tags:

```text
Owner = Sowmya
```

Result:

```text
NON_COMPLIANT
```

Reason:

```text
Missing Environment and Project tags
```

#### Compliant Scenario

EC2 Instance Tags:

```text
Owner = Sowmya
Environment = Dev
Project = AWS-Config
```

Result:

```text
COMPLIANT
```

## Benefits of AWS Config

* Continuous compliance monitoring
* Configuration auditing
* Governance enforcement
* Resource inventory tracking
* Automated compliance evaluation
* Improved security and operational visibility

## Key Learning Outcomes

* Configured AWS Config for resource compliance monitoring.
* Created a custom AWS Config rule.
* Integrated AWS Config with AWS Lambda.
* Implemented tag-based compliance validation.
* Evaluated EC2 resources for compliance status.
* Understood governance and compliance management in AWS.

```
```
