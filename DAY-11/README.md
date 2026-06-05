# AWS CloudFront & CDN Notes

## What is a CDN?

CDN (Content Delivery Network) is a distributed network of servers that stores cached copies of content closer to users.

The primary goal of a CDN is to:

* Reduce latency
* Improve website performance
* Enhance user experience
* Reduce load on origin servers

## Real World Example

Consider Instagram.

When a user uploads an image or video:

```text
User Upload
      |
      v
Central Storage (Origin Server)
```

Without a CDN:

```text
User (India)
      |
      v
Origin Server (USA)
```

Every request must travel a long distance, increasing latency.

With a CDN:

```text
User (India)
      |
      v
Nearest Edge Location
      |
      v
Origin Server (USA)
```

The content is served from a nearby edge location, reducing response time.

## What is Amazon CloudFront?

Amazon CloudFront is AWS's managed Content Delivery Network (CDN) service.

CloudFront caches content at globally distributed edge locations and serves it from the location nearest to the user.

Benefits:

* Faster content delivery
* Reduced latency
* Global availability
* HTTPS support
* DDoS protection integration
* Reduced load on origin servers

## Important Terminology

### Origin

The original source of content.

Examples:

* Amazon S3 Bucket
* EC2 Instance
* Application Load Balancer
* Custom Web Server

Example:

```text
CloudFront
     |
     v
S3 Bucket (Origin)
```

---

### Edge Location

Edge locations are geographically distributed caching locations used by CloudFront.

Example:

```text
User (India)
     |
     v
Mumbai Edge Location
```

### Cache Hit

When CloudFront already has the requested content.

```text
User
  |
  v
CloudFront Cache
```

Response is served immediately.

---

### Cache Miss

When CloudFront does not have the requested content.

```text
User
  |
  v
CloudFront
  |
  v
Origin
```

CloudFront retrieves content from origin and stores it in cache.

---

### TTL (Time To Live)

Defines how long CloudFront keeps content in cache.

Example:

```text
TTL = 1 Hour
```

After expiration, CloudFront fetches a fresh copy from the origin.

---

### Cache Invalidation

Used to remove cached content before TTL expires.

Example:

```text
/Logo.png
```

CloudFront deletes the cached copy and retrieves the latest version from the origin.
