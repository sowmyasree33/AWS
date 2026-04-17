## CI/CD services in AWS

CI-Continuous Integration

CD-Continuous delivery

## CI/CD: Traditional vs AWS Managed Services

1. Traditional CI/CD Flow
   
   Tools used:
   
         Jenkins → CI
   
         Argo CD → CD
   
         GitHub/GitLab → Source code
   
## Workflow

1. Developer pushes code to Git repo
2. Webhook triggers Jenkins pipeline
3. Jenkins handles Continuous Integration (CI):
           Code checkout
           Build + Unit Testing
           Code scanning
           Docker image build
           Image scan
           Push to registry
 4. For Continuous Delivery (CD):
        Jenkins or external tools (like ArgoCD) deploy application
 5.  In GitOps:
        Kubernetes manifests are updated
        ArgoCD ensures cluster matches Git state
     
##  Key Characteristics

->Jenkins does most of the work

->Requires:

  Server setup
  
  Plugin management
  
  Scaling manually
  
->Very flexible but high maintenance

## AWS CI/CD Flow 

AWS replaces Jenkins + multiple tools with managed services:

**AWS CodeCommit**

**AWS CodePipeline**

**AWS CodeBuild**

**AWS CodeDeploy**

## Workflow

1. Developer pushes code to CodeCommit
   
   Trigger starts CodePipeline

## Stage 1: Source

CodePipeline pulls code from CodeCommit

## Stage 2: Build (CI)

AWS CodeBuild runs:

  ->Build commands (Maven, npm, etc.)
     
  ->Unit tests
  
  ->Code scanning (via integrated tools)
  
  ->Docker image build
  
**Output stored in:**
  Amazon S3
   
## Stage 3: Deploy (CD)

1. AWS CodeDeploy:
   
   Deploys to EC2 / Lambda
   
For Kubernetes:

   Use Argo CD instead

## AWS CodeCommit
   
      1. Stores source code (like GitHub)
      2. Private repos only
      3. IAM-based access control
         
## AWS CodePipeline

    1.Orchestrator (controls flow)
    2.Defines stages: Source → Build → Deploy
    3.Does NOT build or deploy itself
    
## AWS CodeBuild
   Executes CI tasks:
        ->Build
        ->Test
        ->Package
   Uses buildspec.yml
   
## AWS CodeDeploy
   Handles deployment:
           EC2
           Lambda
   Supports rolling updates, blue/green deployments

## When to Use What?
   **Use Jenkins when:**
   ->You need flexibility
   ->Multi-cloud or hybrid setup
   ->Complex custom pipelines
   
  **Use AWS CI/CD when:**
    ->Your infra is in AWS 
    ->You want low maintenance
    ->You prefer managed services
    
**CodePipeline supports:**
 
    Manual approval stage
    
    Multiple environments (Dev → QA → Prod)
    
**CodeBuild:**

   Runs inside container
   
   No server needed
   
**CodeDeploy:**

   Supports Blue/Green deployments
   
   Artifacts stored in: Amazon S3

   IAM roles control access across all services
