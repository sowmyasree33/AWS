# AWS ECR and ECS Notes

## Amazon ECR (Elastic Container Registry)

Amazon ECR is a fully managed container registry service provided by AWS.

It is used to store, manage, and distribute Docker container images.

ECR is similar to Docker Hub and Quay.io.

### Why Do We Need a Container Registry?

Suppose a Docker image is built on a developer's laptop.

```text
Developer Machine
        |
        v
Docker Image
```

To share the image with other developers, CI/CD pipelines, or deployment platforms, it must be stored in a centralized registry.

```text
Developer
    |
    v
ECR Repository
    |
    v
ECS / EKS / Kubernetes
```

### Features of ECR

* Fully managed by AWS
* Highly scalable
* Private repositories by default
* Supports image versioning
* Lifecycle policies
* IAM-based access control
* Integration with ECS and EKS

### Tag Immutability

By default, tags can be overwritten.

Example:

```text
v1.0 -> Image A

Later

v1.0 -> Image B
```

If Tag Immutability is enabled:

```text
v1.0 -> Image A
```

AWS prevents overwriting the same tag.

This helps maintain image integrity.

### ECR Lifecycle Policies

Used to automatically delete old images.

Example:

```text
Keep last 10 images
Delete older images
```

Helps optimize storage costs.

---

## AWS CLI Authentication

Verify AWS CLI:

```bash
aws --version
```

Configure credentials:

```bash
aws configure
```

Provide:

* Access Key
* Secret Access Key
* Region
* Output Format

---

# Amazon ECS (Elastic Container Service)

Amazon ECS is AWS's native container orchestration service.

It helps deploy, manage, scale, and monitor containers.

---

## Why Container Orchestration?

Docker provides containerization.

However, large-scale production environments require:

* Auto-healing
* Auto-scaling
* Service discovery
* Load balancing
* Rolling deployments

These requirements are handled by container orchestration platforms such as ECS and Kubernetes.

---

## ECS Architecture

```text
ECS Cluster
      |
      +---- ECS Service
                 |
                 +---- ECS Tasks
                            |
                            +---- Containers
```

---

## ECS Components

### Cluster

Logical grouping of ECS resources.

### Task Definition

Blueprint describing how a container should run.

Includes:

* Docker image
* CPU
* Memory
* Port mappings
* Environment variables

### Task

A running instance of a Task Definition.

### Service

Maintains the desired number of running tasks.

Provides:

* Auto-healing
* Load balancing
* High availability

---

## ECS Launch Types

### Fargate

Serverless container execution.

```text
Container
    |
    v
AWS Manages Infrastructure
```

Advantages:

* No server management
* Easy to operate

### EC2 Launch Type

Containers run on EC2 instances.

```text
Container
    |
    v
EC2 Instance
```

Advantages:

* More control
* Cost-effective for large workloads

---

# ECS vs Kubernetes

## Kubernetes

Open-source container orchestration platform.

Features:

* Auto-healing
* Auto-scaling
* Service discovery
* Rolling updates
* Custom Resource Definitions (CRDs)
* Large ecosystem

Popular tools:

* Helm
* Argo CD
* Prometheus
* Grafana
* Istio

---

## ECS

AWS-native container orchestration platform.

Advantages:

* Simple to use
* Fully integrated with AWS
* Lower operational overhead
* Easier learning curve

---

# Amazon EKS

Amazon EKS (Elastic Kubernetes Service) is AWS's managed Kubernetes service.

AWS manages the Kubernetes control plane while users manage workloads.

---

# Why Organizations Choose EKS Over ECS

Reasons:

* Kubernetes is the industry standard
* Multi-cloud portability
* Avoids vendor lock-in
* Rich ecosystem
* Strong open-source community
* Works across AWS, Azure, GCP, and On-Prem environments

However, for AWS-only environments, ECS is often simpler and easier to manage.

---

# ECS Monitoring

ECS integrates with Amazon CloudWatch for:

* Logs
* Metrics
* Dashboards
* Alarms
* Monitoring

---

# End-to-End Workflow

```text
Docker Build
      |
      v
Docker Image
      |
      v
Push Image to ECR
      |
      v
ECS Pulls Image
      |
      v
Task Starts
      |
      v
Service Maintains Desired Count
```
