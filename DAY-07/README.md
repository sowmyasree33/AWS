## CloudFormation Template

CloudFormation is an Infrastructure as code(IaC) service that allows you to define and provision AWS infrastructure using code.

## How it works??

CloudFormation takes a template as input and directly interacts with AWS services through APIs to provision resources. It interprets the templates and makes API 
calls to create/update resources.

## Usage

CloudFormation templates used for repeatable, consistent infrastructure provisioning, especially when managing multiple related resources.

## Key Features

->Infrastructure as code support

->Declarative templates(YAML/JSON)

->Drift detection : Detects difference between the expected configuration(template) and actual deployed resources

 **Note**  : It only detects changes, it does not fix them automatically.

 ->Stack Management : Create, Update, and delete infrastructue as a single unit

 ->Supports both console(UI) and CLI Usage.

## Template Structure


1. **AWSTemplateFormatVersion** – Template version (fixed: `'2010-09-09'`)

2. **Description** – Brief explanation of what the template does

3. **Metadata** – Extra information for documentation; does not affect resource creation

4. **Parameters** – These are inputs given by the user at runtime.

   Example: instance type, bucket name, etc.

   Helps make templates reusable

5. **Mappings** – used to define static key-value pairs in a CloudFormation template, typically to select values like AMIs or instance types based on region or environment using the FindInMap function

6. **Conditions** – Used to create resources only if a certain condition is true.
   
    Example: create a resource only in production, not in development

7. **Resources** – Defines the AWS resources to be created

8. **Outputs** – Values returned after stack creation (like bucket name, IP address, etc.)


 ## Stack

A stack is a collection of AWS resources that are created and managed together using CloudFormation templates.

**Templates can be:**

Uploaded directly via the AWS Console, or

Stored in Amazon S3 and referenced during stack creation
 
  
