# AWS Load Balancers (ELB) - DevOps Notes

## What is a Load Balancer?

A Load Balancer (LB) is a service that distributes incoming client traffic across multiple backend servers (EC2 instances, containers, IP addresses, etc.) to improve:

* High Availability
* Scalability
* Fault Tolerance
* Performance

### Why Do We Need a Load Balancer?

Consider a gaming application running on a single EC2 instance.

Initially:

```text
Users --> EC2 Instance
```

When the application becomes popular, the number of users increases significantly.

Problems:

* Single server may become overloaded
* Increased response time
* Application downtime
* Poor user experience

To solve this:

1. Launch multiple EC2 instances.
2. Use Auto Scaling to add/remove instances based on traffic.
3. Place a Load Balancer in front of the instances.

```text
Users
  |
  V
Load Balancer
  / | \
EC2 EC2 EC2
```

The Load Balancer receives all incoming traffic and distributes requests among healthy backend servers.

# Types of AWS Load Balancers

AWS Elastic Load Balancing (ELB) provides four types of load balancers:

1. Application Load Balancer (ALB)
2. Network Load Balancer (NLB)
3. Gateway Load Balancer (GWLB)
4. Classic Load Balancer (CLB - Legacy)

# Common Load Balancing Algorithms

## Round Robin

Requests are distributed sequentially among servers.

```text
Request 1 --> Server A
Request 2 --> Server B
Request 3 --> Server C
Request 4 --> Server A
```

Best when backend servers have similar capacity.

## Least Outstanding Requests

Traffic is sent to the server handling the fewest active requests.

## Weighted Routing

More traffic is sent to servers with higher assigned weights.

Example:

```text
Server A - Weight 70%
Server B - Weight 30%
```

## Sticky Sessions

Ensures a user's requests continue going to the same backend server for a period of time.

Useful when applications store session data locally.

# Popular Load Balancers

Software-based load balancers:

* NGINX
* HAProxy
* Envoy
* Traefik

Cloud Load Balancers:

* AWS ELB
* Azure Load Balancer
* Google Cloud Load Balancer

# Understanding OSI Model for Load Balancers

Load balancers operate at different layers of the OSI model.

This is important because:

* ALB operates at Layer 7
* NLB operates at Layer 4

## Example Request Flow

Suppose a user opens:

```text
https://linkedin.com/in/abhishek-veramalla
```

The request travels through the network and eventually reaches LinkedIn's servers.

During this process, the request passes through multiple OSI layers.

# Layer 7 - Application Layer

Responsible for application protocols.

Examples:

* HTTP
* HTTPS
* FTP
* SMTP
* DNS

When a user enters a URL in a browser, an HTTP/HTTPS request is created at this layer.

Application Load Balancer (ALB) works at this layer.

# Layer 6 - Presentation Layer

Responsible for:

* Encryption
* Decryption
* Compression
* Data formatting

Examples:

* TLS
* SSL (deprecated)
* JSON
* XML

Modern applications primarily use TLS.

# Layer 5 - Session Layer

Responsible for:

* Session establishment
* Session maintenance
* Session termination

Examples:

* User login sessions
* Authentication sessions

# Layer 4 - Transport Layer

Responsible for:

* Data segmentation
* Reliability
* Flow control
* Port communication

Protocols:

* TCP
* UDP

Examples:

```text
HTTP  -> Port 80
HTTPS -> Port 443
SSH   -> Port 22
```

Network Load Balancer (NLB) operates at this layer.

# Layer 3 - Network Layer

Responsible for:

* IP addressing
* Routing
* Packet forwarding

Devices:

* Routers

Protocols:

* IPv4
* IPv6
* ICMP

This layer determines how packets travel from source to destination.

# Layer 2 - Data Link Layer

Responsible for:

* MAC addressing
* Communication within local networks

Devices:

* Switches
* Bridges

# Layer 1 - Physical Layer

Responsible for physical transmission of data.

Examples:

* Fiber optic cables
* Ethernet cables
* Network hardware

# Application Load Balancer (ALB)

ALB operates at Layer 7 (Application Layer).

It understands application-level information such as:

* URLs
* HTTP headers
* Hostnames
* Query strings
* Cookies

Protocols Supported:

* HTTP
* HTTPS
* WebSockets

## ALB Features

### Path-Based Routing

```text
/api      --> Backend A
/images   --> Backend B
```

### Host-Based Routing

```text
api.company.com   --> Backend A
shop.company.com  --> Backend B
```

### SSL/TLS Offloading

Client communicates securely with ALB.

```text
Client --> HTTPS --> ALB
ALB --> HTTP --> EC2
```

This reduces encryption overhead on backend servers.

### Re-encryption

```text
Client --> HTTPS --> ALB
ALB --> HTTPS --> EC2
```

Traffic remains encrypted end-to-end.

### Integration Support

Works seamlessly with:

* EC2
* ECS
* EKS
* Kubernetes Ingress
* Lambda Functions

## ALB Use Cases

* Web Applications
* REST APIs
* Microservices
* Containerized Applications

# Network Load Balancer (NLB)

NLB operates at Layer 4 (Transport Layer).

Unlike ALB, it does not inspect HTTP requests.

Instead, it forwards traffic based on:

* TCP
* UDP
* TLS connections

## NLB Characteristics

* Extremely low latency
* Very high throughput
* Preserves client source IP
* Supports static IP addresses
* Millions of requests per second

## NLB Use Cases

* Gaming servers
* Streaming applications
* VoIP systems
* Real-time communication
* Financial trading applications

When ultra-low latency is required, NLB is generally preferred.

# Gateway Load Balancer (GWLB)

GWLB is designed specifically for network security appliances.

Examples:

* Firewalls
* IDS (Intrusion Detection Systems)
* IPS (Intrusion Prevention Systems)
* Deep Packet Inspection solutions

## GWLB Traffic Flow

```text
Internet
    |
    V
GWLB
    |
    V
Firewall Appliance
    |
    V
Application
```

## GWLB Benefits

* Centralized traffic inspection
* Scalable security architecture
* Simplified firewall deployment
* High availability for security appliances

# Classic Load Balancer (CLB)

Legacy AWS load balancer.

Supports:

* Layer 4
* Layer 7

Mostly replaced by ALB and NLB.

Not recommended for new deployments.

# Health Checks

Load Balancers continuously monitor backend targets.

Example:

```text
EC2-A --> Healthy
EC2-B --> Healthy
EC2-C --> Unhealthy
```

Traffic is sent only to healthy targets.

Unhealthy instances are automatically removed from traffic rotation.

# Target Groups

Load Balancers do not directly send traffic to EC2 instances.

Instead, they send traffic to Target Groups.

```text
Load Balancer
      |
      V
Target Group
      |
      V
EC2 Instances
```

Supported targets:

* EC2 Instances
* ECS Tasks
* IP Addresses
* Lambda Functions (ALB)

---

# Cross-Zone Load Balancing

Suppose:

```text
AZ-1 --> 10 Instances
AZ-2 --> 2 Instances
```

Without Cross-Zone Load Balancing:

Traffic may be unevenly distributed.

With Cross-Zone Load Balancing:

Traffic is distributed evenly across all healthy targets.

# Auto Scaling Integration

One of the most common production architectures:

```text
Users
   |
   V
Load Balancer
   |
Target Group
   |
Auto Scaling Group
   |
EC2 Instances
```

Traffic Increase:

```text
Traffic Increases
        |
        V
Auto Scaling Launches New Instances
        |
        V
Instances Registered to Target Group
        |
        V
Load Balancer Starts Sending Traffic
```

Traffic Decrease:

```text
Auto Scaling Removes Extra Instances
```

# ALB vs NLB

| Feature                | ALB                  | NLB                               |
| ---------------------- | -------------------- | --------------------------------- |
| OSI Layer              | Layer 7              | Layer 4                           |
| Protocols              | HTTP/HTTPS/WebSocket | TCP/UDP/TLS                       |
| URL Based Routing      | Yes                  | No                                |
| Host Based Routing     | Yes                  | No                                |
| SSL Offloading         | Yes                  | Limited                           |
| Latency                | Low                  | Very Low                          |
| Source IP Preservation | No (via headers)     | Yes                               |
| Best For               | Web Apps, APIs       | Gaming, Streaming, Real-time Apps |

