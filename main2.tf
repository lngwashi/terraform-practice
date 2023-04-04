terraform {
  required_version = "~> 1.0" #1.1.4/5/6/7   1.2/3/4/5 1.1.4/5/6/7
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

}
/*
  backend "s3" {
    bucket = "terraform-mylandmark"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
    # For State Locking
    dynamodb_table = "terraform-lock"
  }
  */

resource "aws_dynamodb_table" "tf_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 3
  write_capacity = 3
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "Terraform Lock Table"
  }
}

provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal $HOME/.aws/credentials
  region  = "us-east-1"
}

resource "aws_instance" "class25" {
  ami           = "ami-0e5b6b6a9f3db6db8" # Amazon Linux
  instance_type = var.instance_type
}

variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 Instance Type"
  type        = string
}

output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.class25.public_ip
}

# Block-6: **Local Values Block**
# Create S3 Bucket - with Input Variables & Local Values

/*
locals {
  name = "${var.app_name}-${var.environment_name}"
}
bucket_name = locals.name
*/


# Block-7: **Data sources Block**
# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}
