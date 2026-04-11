**VPC-Virtual Private Cloud** ,**Security Groups , NACL**

VPC allows you to create a private space inside AWS cloud. Its nothing but a logically isolated network which is more secure.
VPC is created with a IP address range and this ranges are divided into smaller networks called subnets.
A subnet is a subdivision of VPC's IP range and it has 2 types
1. Public Subnet-Contains resources that can be accessed by the public and it has route to internet gateway.
2. Privaye Subnet-Contains resources that should be accessible only through private network(like databases).It has no direct internet access.

Internet gateway-> Allows communication between VPC resources and the internet

NAT gateway-> Allows instances in a private subnet to access the internet(outbound only). It prevents inbound internet access.

Virtual Private gateway(VGW)->It is used to connect VPC to external networks(on premises)
EX: Company data center wants to securely connect to AWS then you use VGW. 

**AWS Direct Connect** is a service that lets you to establish a dedicated private connection between your data center and a VPC. 

Route tables->This defines how traffic flows within a VPC. It's like a traffic rule book.It tells AWS if traffic is going to this destination->send it through this path.

Elastic Load balancer->It distributes the incoming traffic across multiple targets

Target Groups->Group of backened servers, ELB doesn't send traffic directly to ec2 instances,it sends to target groups. Here the important point is Target groups 
performs health checks i.e if any ec2 instance is down then traffic is not sent there.

Security Groups->It is a virtual firewall that controls inbound and outbound traffic for an EC2 instance. By default, Security group denies all inbound traffic and allows
outbound traffic.You should add custom rules to configure which traffic should be allowed.

NACL(Network access control list)->It is a virtual firewall that control inbound and outbound traffic at subnet level.Each AWS account includes a default 
network ACL(this allows all inbound and outbound traffic).When you create a new custom NACL nothing is allowed until you explicitly allows it.

VPC flow logs->It captures network traffic logs and used for monitoring,trouble shooting.

Example Request Flow

User request enters through the Internet Gateway, reaches the Load Balancer in the public subnet, which forwards it to a target group 
containing EC2 instances in private subnets, and the response is sent back through the Load Balancer to the user.
