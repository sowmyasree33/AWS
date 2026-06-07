#VPC creation
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
  tags = {
    Name = "Sowmya-VPC"
  }
}
#Subnet Creation
resource "aws_subnet" "mysub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-1"
  }
}
resource "aws_subnet" "mysub2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-2"
  }
}
#Internetgateway creation
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Sowmya-IGW"
  }
}
#route table creation
resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "Public-RT"
  }
}
resource "aws_route_table_association" "myrtba1" {
  subnet_id      = aws_subnet.mysub1.id
  route_table_id = aws_route_table.myrt.id
}
resource "aws_route_table_association" "myrtba2" {
  subnet_id      = aws_subnet.mysub2.id
  route_table_id = aws_route_table.myrt.id
}
#security group
resource "aws_security_group" "mysg" {
  name   = "mysg"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sowmya-sg"
  }
}
#S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "sowmya-terraform-project-bucket-2026"
  tags = {
    Name = "Portfolio-Bucket"
  }
}
#IAM Role for EC2 → S3 Access
resource "aws_iam_role" "ec2_role" {
  name = "EC2-S3-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
#S3 ReadOnly Policy
resource "aws_iam_role_policy_attachment" "s3_readonly" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
#EC2 cannot directly use IAM Roles and Terraform must create an Instance Profile.
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2-S3-Profile"
  role = aws_iam_role.ec2_role.name
}
#EC2 instance creation
resource "aws_instance" "web1" {
  ami                         = "ami-0685bcc683dadb6b9"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.mysub1.id
  vpc_security_group_ids      = [aws_security_group.mysg.id]
  key_name                    = "test_keypair"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  user_data                   = file("userdata.sh")
  user_data_replace_on_change = true
  tags = {
    Name = "Apache-Server-1"
  }
}
resource "aws_instance" "web2" {
  ami                         = "ami-0685bcc683dadb6b9"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.mysub2.id
  vpc_security_group_ids      = [aws_security_group.mysg.id]
  key_name                    = "test_keypair"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  user_data                   = file("userdata2.sh")
  user_data_replace_on_change = true
  tags = {
    Name = "Apache-Server-2"
  }
}
#Creation of ALB Security group
resource "aws_security_group" "alb_sg" {
  name   = "alb-sg"
  vpc_id = aws_vpc.myvpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ALB-SG"
  }
}
#Creation of Target Group
resource "aws_lb_target_group" "portfolio_tg" {
  name     = "portfolio-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.myvpc.id
  health_check {
    path = "/"
  }
  tags = {
    Name = "Portfolio-TG"
  }
}
#Creation of ALB
resource "aws_lb" "portfolio_alb" {
  name               = "portfolio-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.alb_sg.id
  ]
  subnets = [
    aws_subnet.mysub1.id,
    aws_subnet.mysub2.id
  ]
  tags = {
    Name = "Portfolio-ALB"
  }
}
#Register of EC instance 1
resource "aws_lb_target_group_attachment" "server1" {
  target_group_arn = aws_lb_target_group.portfolio_tg.arn
  target_id = aws_instance.web1.id
  port = 80
}
#Register of EC2 instance 2
resource "aws_lb_target_group_attachment" "server2" {
  target_group_arn = aws_lb_target_group.portfolio_tg.arn
  target_id = aws_instance.web2.id
  port = 80
}
#Creation of listener
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.portfolio_alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.portfolio_tg.arn
  }
}
