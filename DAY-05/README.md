## Amazon S3 - Simple Storage Service

Amazon s3 is a object storage service that is scalable, highly available, secure, durable and cost-effective.

## BASIC
Data is stored in Buckets

Files stored in buckets called Objects

Each bucket name must be globally unique across all AWS accounts as S3 is accessible globally

Buckets are created in specific region, but objects can be accessed globally via HTTP/HTTPS API's


## Accessibility
S3 uses HTTP/HTTPS protocols for access

By default, all buckets and objects are private

Public access requires: 

          -> Disabling block public access
          
          -> Adding proper bucket policies or ACL's(Access control lists)

## Durability and availability

S3 provides 99.99999999999%(11 9's) durability

Data is automatically replicated across multiple AZs(Availability Zones) within a region by default

S3 also supports optional replication (CRR/SRR) that must be configured separately
        
        -> Cross-region replication : CRR copies objects from a bucket in one region to a bucket in a different region.
        
        -> Same-region replication  : SRR copies objects between buckets within the same region.

CRR replicates data across regions for disaster recovery, while SRR replicates within the same region for data separation and compliance

## Encryption and Access control
Data encryption in s3 includes: 

     -> Data at rest : Data at rest refers to data stored in S3 buckets. Amazon S3 automatically encrypts stored data to ensure durability and security.

        Server-Side Encryption (SSE) Types:
        
             1. SSE-S3 (Default):
             
                 AWS manages encryption keys.
             
                 Automatically enabled for all new objects.
                 
                 Suitable for general use cases.
             
             2. SSE-KMS: 
             
                 Uses AWS Key Management Service (KMS) for key management.
                 
                 Provides fine-grained control over access to encryption keys.
                 
                 Supports key rotation and auditing via CloudTrail.
                 
                 Recommended for applications requiring compliance and enhanced security.
                 
             3. SSE-C (Customer-Provided Keys):
                
                Users provide their own encryption keys during upload.
                
                AWS does not store these keys.
                
                The same key must be provided to retrieve the object.
                
                If the key is lost, the data cannot be recovered.
                
      -> Data in Transit : Data in transit refers to data moving between systems (e.g., client to S3 or S3 to EC2).
          
          Secured using HTTPS (TLS protocol). 
          
          Prevents interception or unauthorized access during data transfer.

Encryption protects data, but access control determines who can access it.

## Access Control Mechanisms:

IAM Policies: Define permissions for users, groups, and roles.

Bucket Policies: Control access at the bucket level.

Access Control Lists (ACLs): Legacy mechanism, less commonly used.

## Scalability

Amazon S3 is designed to provide virtually unlimited scalability for storing data.

Unlimited Storage : A single S3 bucket can store an unlimited number of objects.

Maximum Object Size : The maximum size of a single object in S3 is 5 TB.

## Multipart Upload

Amazon S3 supports Multipart Upload, which allows large files to be uploaded efficiently.

 ->Large files are split into smaller parts.
 
 ->Each part is uploaded independently and in parallel.
 
 ->After all parts are uploaded, S3 combines them into a single object.
 
## Versioning

Versioning allows storing multiple versions of an object

Must be enabled manually

With out versioning : uploading the same object overwrites previous version

##  Types of Storage Classes 

Amazon S3 provides different storage classes to optimize cost based on access patterns and data lifecycle.

### 1. S3 Standard
* Designed for **frequently accessed data**
* Provides **low latency (milliseconds)** and high throughput
* No retrieval charges
* Used for applications, websites, and active data

### 2. S3 Standard-IA (Infrequent Access)
* For **infrequently accessed data**, but requires **rapid access when needed**
* Retrieval charges apply
* Lower storage cost compared to Standard
* Minimum storage duration: **30 days**
  
### 3. S3 One Zone-IA
* Stores data in a **single Availability Zone**
* Lower cost than Standard-IA
* Suitable for **non-critical or easily reproducible data**
* Minimum storage duration: **30 days**

### 4. S3 Glacier Instant Retrieval
* For **rarely accessed data that still needs millisecond access**
* Lower cost than Standard-IA
* Minimum storage duration: **90 days**
  
### 5. S3 Glacier Flexible Retrieval
* For **archival data** with flexible retrieval times
* Retrieval options:
  * **Expedited:** 1–5 minutes
  * **Standard:** 3–5 hours
  * **Bulk:** 5–12 hours
* Minimum storage duration: **90 days**
  
### 6. S3 Glacier Deep Archive
* For **long-term archival storage (lowest cost)**
* Retrieval options:
  * **Standard:** ~12 hours
  * **Bulk:** ~48 hours
* Minimum storage duration: **180 days**
  
### 7. S3 Intelligent-Tiering
* Automatically moves data between tiers based on access patterns
* No retrieval charges for frequent and infrequent tiers
* Small monitoring and automation cost per object
* Ideal when access patterns are unknown


