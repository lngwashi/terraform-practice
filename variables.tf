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

variable "sshport" {
  type    = string
  default = "22"

}

variable "enabled" {
  default = false

}

variable "instance_type_map" {
  description = "EC2 Instance Type"
  type        = map(string)
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}
