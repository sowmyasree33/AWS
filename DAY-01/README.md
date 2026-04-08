**DAY 1**

**IAM (Identity and Access Management)** 
IAM helps to securely control access to AWS resources. It enables authentication(who can access) and authorization(what actions they perform). 
IAM follows the principle of "least Privilege", which means users are given only the permissions required to perform their tasks. 
This helps organizations protect their sensitive resources by restricting unnecessary access.
# Key Components of IAM

**User**

A User represents an individual person that needs access to the AWS environment.
When a person joins an organization, an IAM user is created for them.
The permissions (what a user can or cannot do) are controlled using policies, which are attached directly to the user or inherited through groups.

**Group**

A Group is a collection of users with similar access requirements.
Creating individual users and attaching policies to each of them is not an efficient or scalable process. 
To simplify management, users are added to groups, and policies are attached to the group instead of individual users.
Example:
Developers → Access to development resources
Testers → Access to testing environments
When a new user joins, they can simply be added to the appropriate group, and the required permissions are automatically applied.

**Roles**

Roles are similar to users, but they provide temporary access and do not have permanent credentials.
Roles are used to grant secure access to AWS resources without sharing long-term access keys. 
They are commonly used for interactions between AWS services or for granting temporary access to users or applications.

**Policies**

IAM policies are JSON documents that defines permissions. 
Policies can be attached to users,groups,roles to control access.
