
# 🚀 Terraform AWS Web Application Project 🖥️

Welcome to the **Terraform AWS Web Application Project**! This project is designed to help you manage a 3-tiered web application on AWS using Terraform. It includes an **EC2 instance** (backend API), an **RDS database**, and **Lambda functions**, as well as associated **VPC** and **security group** resources. 

## 🛠️ Project Structure
The project is structured into **modules** for better organization. Here's how everything is laid out:

### 📁 Project Structure:
```
.
├── main.tf                   # Main Terraform configuration file
├── terraform.tfvars           # Variables file for non-sensitive values
├── variables.tf               # Variables definitions
├── provider.tf                # AWS provider configuration
├── modules/
│   ├── ec2/
│   │   └── main.tf            # EC2 instance module
│   ├── rds/
│   │   └── main.tf            # RDS instance module
│   ├── lambda/
│   │   └── main.tf            # Lambda functions module
│   ├── vpc/
│   │   └── main.tf            # VPC module
│   └── security_group/
│       └── main.tf            # Security Group module
└── README.md                  # This file!
```

## 📦 Prerequisites
To run this project, you'll need:

- 🐍 **Terraform**: v0.14 or later
- ☁️ **AWS Account**: Access to your AWS account with permissions to create and manage resources
- 🖥️ **AWS CLI** (Optional): To set up your AWS credentials

## 📈 Setting Up Your Environment

### 🔑 Step 1: Set Up AWS Credentials
Before using Terraform, you need to set your AWS credentials via environment variables. This way, Terraform will automatically use them.

1. **Linux/macOS**:
   ```bash
   export AWS_ACCESS_KEY_ID="your-access-key-id"
   export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
   export AWS_REGION="us-east-1"  # or your preferred AWS region
   ```

2. **Windows Command Prompt**:
   ```cmd
   set AWS_ACCESS_KEY_ID=your-access-key-id
   set AWS_SECRET_ACCESS_KEY=your-secret-access-key
   set AWS_REGION=us-east-1
   ```

3. **Windows PowerShell**:
   ```powershell
   $env:AWS_ACCESS_KEY_ID="your-access-key-id"
   $env:AWS_SECRET_ACCESS_KEY="your-secret-access-key"
   $env:AWS_REGION="us-east-1"
   ```

---

### 🔧 Step 2: Modify `terraform.tfvars` (Optional)
In **`terraform.tfvars`**, you can specify your **AWS region** (if you don’t want to use the environment variable).

Example:
```hcl
# terraform.tfvars
aws_region = "us-east-1"
```

You don't need to define AWS access keys here, as Terraform will get them from the environment variables.

---

### 🖥️ Step 3: Initialize Terraform

In your project directory, run the following to initialize Terraform:

```bash
terraform init
```

---

### 🧐 Step 4: Preview the Terraform Plan

Before applying changes, preview them to ensure everything is configured correctly:

```bash
terraform plan
```

---

### 🚀 Step 5: Apply the Terraform Configuration

Once you're ready, apply the configuration to create resources in AWS:

```bash
terraform apply
```

---

## 🗂️ Modules Breakdown

The project is modularized into individual components to help you manage each AWS service separately.

### 1. **EC2 Instance (`modules/ec2`)** 🖥️
This module creates the **EC2 instance** that will run your backend API.

Example `modules/ec2/main.tf`:
```hcl
resource "aws_instance" "backend" {
  ami           = "ami-xxxxxxxxxx"  # Replace with your AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Backend EC2 Instance"
  }
}
```

### 2. **RDS Database (`modules/rds`)** 🗄️
This module creates an **RDS database** that will store your application's data.

Example `modules/rds/main.tf`:
```hcl
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  db_instance_class    = "db.t2.micro"
  engine               = "mysql"
  engine_version       = "5.7"
  name                 = "exampledb"
  username             = "admin"
  password             = "adminpassword"  # Use a more secure password in production
  parameter_group_name = "default.mysql5.7"

  tags = {
    Name = "RDS Database"
  }
}
```

### 3. **Lambda Functions (`modules/lambda`)** 🐑
This module creates **AWS Lambda functions** for your application.

Example `modules/lambda/main.tf`:
```hcl
resource "aws_lambda_function" "my_function" {
  function_name = "MyLambdaFunction"
  s3_bucket     = "my_lambda_code_bucket"
  s3_key        = "lambda.zip"
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  environment {
    variables = {
      EXAMPLE_VAR = "value"
    }
  }
}
```

### 4. **VPC (`modules/vpc`)** 🌐
This module creates a **VPC** to house all your resources.

Example `modules/vpc/main.tf`:
```hcl
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Main VPC"
  }
}
```

### 5. **Security Group (`modules/security_group`)** 🔒
This module creates a **Security Group** for your resources.

Example `modules/security_group/main.tf`:
```hcl
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP traffic"

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
}
```

---

## 🛑 Clean Up

To remove all the resources you created, run:

```bash
terraform destroy
```

---

## 🎉 Congratulations! You've Deployed Your Web Application!

You’ve successfully set up and applied a 3-tier web application on AWS using Terraform! 🎉

## 💬 Questions or Issues?

Feel free to open an issue or ask questions. Happy coding! 👨‍💻👩‍💻

