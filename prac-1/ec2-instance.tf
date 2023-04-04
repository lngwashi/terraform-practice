terraform {
  required_version = "~> 1.0" #1.1.4/5/6/7   1.2/3/4/5 1.1.4/5/6/7
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

}

provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal $HOME/.aws/credentials
  region  = "us-east-1"
}


resource "aws_instance" "myec2vm" {
  ami           = "ami-0533f2ba8a1995cf9"
  instance_type = "t3.micro"
  user_data     = file("${path.module}/app.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}
