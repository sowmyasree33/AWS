#!/bin/bash

yum update -y
yum install httpd -y

cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sowmya's Portfolio</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

body{
    background:#f4f7fc;
    color:#333;
    line-height:1.6;
}

header{
    background:linear-gradient(135deg,#232f3e,#ff9900);
    color:white;
    text-align:center;
    padding:50px 20px;
}

header h1{
    font-size:3rem;
}

header p{
    margin-top:10px;
    font-size:1.2rem;
}

.container{
    width:90%;
    max-width:1200px;
    margin:auto;
    padding:30px 0;
}

.card{
    background:white;
    margin-bottom:20px;
    padding:25px;
    border-radius:12px;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
}

.card h2{
    color:#ff9900;
    margin-bottom:15px;
}

.skills{
    display:flex;
    flex-wrap:wrap;
    gap:10px;
}

.skill{
    background:#232f3e;
    color:white;
    padding:10px 15px;
    border-radius:20px;
}

.project{
    border-left:4px solid #ff9900;
    padding-left:15px;
    margin-bottom:15px;
}

footer{
    background:#232f3e;
    color:white;
    text-align:center;
    padding:20px;
    margin-top:30px;
}

.badge{
    display:inline-block;
    background:#28a745;
    color:white;
    padding:8px 15px;
    border-radius:20px;
    margin-top:10px;
}

</style>

</head>

<body>

<header>
    <h1>Sowmya's Portfolio</h1>
    <p>Aspiring Cloud & DevOps Engineer</p>
    <div class="badge">AWS Certified Cloud Practitioner (2025-2028)</div>
</header>

<div class="container">

<div class="card">
<h2>Professional Summary</h2>

<p>
Test Management Consultant at Strada Global with experience in
integration testing, data validation, and enterprise system workflows.
Passionate about AWS Cloud, Terraform, DevOps, CI/CD automation,
Infrastructure as Code, and cloud-native technologies.
</p>

</div>

<div class="card">
<h2>Skills</h2>

<div class="skills">

<div class="skill">AWS</div>
<div class="skill">Terraform</div>
<div class="skill">CI/CD</div>
<div class="skill">AWS CodePipeline</div>
<div class="skill">AWS CodeBuild</div>
<div class="skill">AWS CodeDeploy</div>
<div class="skill">Linux</div>
<div class="skill">SQL</div>
<div class="skill">GitHub</div>
<div class="skill">VS Code</div>
<div class="skill">Arduino</div>
<div class="skill">Windows</div>

</div>

</div>

<div class="card">

<h2>AWS Projects</h2>

<div class="project">

<h3>AWS CI/CD Implementation</h3>

<p>
Implemented a complete CI/CD pipeline using AWS CodePipeline,
CodeBuild, and CodeDeploy. Integrated GitHub source control and
automated build and deployment workflows.
</p>

</div>

<div class="project">

<h3>AWS Production Architecture Deployment</h3>

<p>
Designed and deployed a production-style AWS architecture with
VPC, Public and Private Subnets, Bastion Host, Auto Scaling,
Application Load Balancer, and EC2 instances.
</p>

</div>

<div class="project">

<h3>Terraform AWS Infrastructure Project</h3>

<p>
Provisioned AWS infrastructure using Terraform including VPC,
Subnets, Internet Gateway, Route Tables, Security Groups,
IAM Roles, EC2 Instances, S3 Bucket, and Application Load Balancer.
</p>

</div>

</div>

<div class="card">

<h2>Professional Experience</h2>

<h3>Test Management Consultant | Strada Global</h3>

<p>
July 2024 - Present
</p>

<br>

<ul>

<li>Performed end-to-end integration testing in SuccessFactors.</li>

<li>Validated data flow between HRIS, middleware, and payroll systems.</li>

<li>Collaborated with cross-functional teams to troubleshoot integration issues.</li>

<li>Developed strong skills in system integration, analysis, and client communication.</li>

</ul>

</div>

<div class="card">

<h2>Education</h2>

<h3>VNR Vignana Jyothi Institute of Engineering and Technology</h3>

<p>
B.Tech - Computer Science & Engineering (Internet of Things)
</p>

<p>
2020 - 2024
</p>

<p>
CGPA: 8.67
</p>

</div>

<div class="card">

<h2>Certifications</h2>

<ul>

<li>AWS Certified Cloud Practitioner (2025 - 2028)</li>

<li>AWS Cloud Practitioner Essentials - AWS Skill Builder</li>

</ul>

</div>

<div class="card">

<h2>Hobbies</h2>

<ul>

<li>Listening to Music</li>
<li>Going to Gym</li>
<li>Cooking</li>
<li>Playing Board Games</li>

</ul>

</div>

<div class="card">

<h2>Server Information</h2>

<p>
Served by Apache Server 1
</p>

</div>

</div>

<footer>

<p>
Built using AWS, Linux, Apache and Terraform
</p>

</footer>

</body>
</html>
EOF

systemctl start httpd
systemctl enable httpd