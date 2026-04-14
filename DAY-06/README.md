## AWS CLI(Command Line Interface)

AWS CLI is a tool that allows users to interact with AWS services using commands in a terminal. 

CLI enables: 

      -> Automation using scripts
      
      ->Faster and repeatable operations

AWS CLI interacts with AWS services by making API calls using configured credentials.

AWS CLI is platform-independent and can be used on Windows, Linux, and macOS.

## Authetication

To use AWS CLI, you need credentials:

    ->Access keyID
    
    ->Secret Access Key 

These are configured using **aws configure** command.

## Note

It is a best practice to use IAM users or roles for accessing AWS services.

Root account credentials should be avoided, as they provide unrestricted access to all AWS resources and increase security risk.

## CLI Command Structure

aws <service> <operation> <parameter>

aws ->Entry point for all commands

service ->Aws service you want to use 

EX: ec2,s3

operation ->what action you want to perform 

EX: ls(list),mb(make-bucket),run-instances(ec2)

parameter ->Extra inputs required for the command (optional)

EX: bucket names, region, path
