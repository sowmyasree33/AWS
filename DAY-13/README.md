# AWS Secret Management

## Introduction

Applications often require sensitive information such as:

- Database passwords
- API keys
- OAuth tokens
- SSH keys
- Certificates
- Third-party service credentials

Storing these values in source code, configuration files, or repositories is a security risk.

AWS provides managed services for securely storing and managing secrets.

The three commonly used solutions are:

1. AWS Systems Manager Parameter Store
2. AWS Secrets Manager
3. HashiCorp Vault

# 1. AWS Systems Manager Parameter Store

Parameter Store is a feature of AWS Systems Manager that allows applications to securely store configuration data and secrets.

## Supported Parameter Types

### String

Plain text value.

Example:

Environment = Production

### StringList

Multiple values separated by commas.

Example:

Server1,Server2,Server3

### SecureString

Encrypted value using AWS KMS.

Example:

DatabasePassword

## Features

- Centralized configuration management
- KMS encryption support
- IAM-based access control
- Hierarchical parameter organization
- Version tracking
- Integration with EC2, Lambda, ECS, and EKS

Example hierarchy:

/prod/database/password

/prod/database/host

/dev/database/password

## Use Cases

Store:

- Application configuration
- Environment variables
- Feature flags
- Non-critical secrets
- Infrastructure configuration

## Advantages

- Low cost
- Easy to use
- Integrated with AWS services
- Supports encryption

## Limitations

- Limited secret rotation capabilities
- Fewer secret-management features compared to Secrets Manager

# 2. AWS Secrets Manager

AWS Secrets Manager is a dedicated secret-management service designed for highly sensitive credentials.

## Types of Secrets

- Database passwords
- API keys
- OAuth tokens
- Service credentials
- Encryption keys
- Third-party application secrets

## Features

### Secure Storage

Secrets are encrypted using AWS KMS.

### Secret Versioning

Multiple versions of a secret can be maintained.

### Automatic Rotation

Secrets can be rotated automatically.

Examples:

- RDS passwords
- Database credentials
- Application secrets

### IAM Integration

Fine-grained access control using IAM policies.

### Audit Logging

All access can be tracked through AWS CloudTrail.

## Secret Rotation Workflow

Application
        |
        v
Secrets Manager
        |
        v
Rotates Credential
        |
        v
Database / Service

Benefits:

- Reduces risk of credential leakage
- Limits damage from compromised credentials
- Improves compliance and security posture

## Advantages

- Automatic rotation
- Strong security controls
- Version management
- Native AWS integration
- Auditability

## Limitations

- More expensive than Parameter Store
- Primarily designed for AWS ecosystems

# Parameter Store vs Secrets Manager

| Feature | Parameter Store | Secrets Manager |
|----------|----------|----------|
| Cost | Lower | Higher |
| Configuration Storage | Yes | Limited |
| Secret Storage | Yes | Yes |
| Automatic Rotation | No | Yes |
| Versioning | Yes | Yes |
| KMS Encryption | Yes | Yes |
| Recommended for Highly Sensitive Secrets | Limited | Yes |

# 3. HashiCorp Vault

HashiCorp Vault is an open-source secret management platform used across multiple cloud providers and on-premises environments.

## Why Vault?

Organizations often operate in:

- AWS
- Azure
- GCP
- Hybrid Cloud
- On-Premises Datacenters

Using a cloud-specific secret service can create vendor lock-in.

Vault provides a unified secret management solution across environments.

## Key Features

### Dynamic Secrets

Vault can generate temporary credentials on demand.

Example:

Username: temp_user

Password: xxxxx

Validity: 1 hour

After expiration, credentials are automatically revoked.

### Secret Leasing

Secrets have a defined lifetime.

Example:

Lease Duration = 60 minutes

### Secret Revocation

Compromised credentials can be immediately revoked.

### Encryption as a Service

Vault can encrypt and decrypt data without exposing encryption keys.

### Multi-Cloud Support

Works with:

- AWS
- Azure
- GCP
- Kubernetes
- On-Premises Infrastructure

## Advantages

- Cloud agnostic
- Open source
- Dynamic secrets
- Secret leasing
- Strong security model
- Multi-cloud support

## Limitations

- Requires deployment and maintenance
- Operational complexity
- Learning curve compared to AWS managed services

# AWS KMS and Secret Management

AWS Key Management Service (KMS) is used to encrypt secrets stored in:

- Systems Manager Parameter Store (SecureString)
- AWS Secrets Manager

Benefits:

- Encryption at rest
- Centralized key management
- Access control through IAM
- Audit logging

# IAM and Secret Access

Access to secrets should be controlled using IAM policies and IAM roles.

Best practice:

- Grant only the permissions required.
- Follow the Principle of Least Privilege.
- Avoid sharing credentials between applications.

Example:

Application A can read Secret A.

Application B cannot access Secret A.

# Monitoring and Auditing

Use:

- AWS CloudTrail
- Amazon CloudWatch

to monitor:

- Secret access
- Secret modifications
- Unauthorized access attempts

This improves security and compliance.

# Best Practices for Secret Management

1. Never hardcode secrets in source code.
2. Use IAM roles instead of long-term credentials whenever possible.
3. Enable encryption using AWS KMS.
4. Rotate secrets regularly.
5. Follow the Principle of Least Privilege.
6. Monitor secret access using CloudTrail and CloudWatch.
7. Use Secrets Manager for highly sensitive credentials.
8. Use Parameter Store for configuration management.
9. Consider Vault for multi-cloud or hybrid-cloud environments.
10. Avoid storing secrets in Git repositories.

# Quick Summary

| Service | Best Used For |
|-----------|-------------|
| Parameter Store | Application configuration and simple secrets |
| Secrets Manager | Sensitive secrets with automatic rotation |
| HashiCorp Vault | Multi-cloud and advanced secret management |
