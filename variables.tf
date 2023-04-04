/*terraform {
  required_version = "~> 1.0" #1.1.4/5/6/7   1.2/3/4/5 1.1.4/5/6/7
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

}*/

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}
/*
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}
*/
variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type        = string
  default     = "terraform-key"
}

variable "sshport" {
  type    = string
  default = "22"

}

variable "enabled" {
  default = false

}

/*
variable "instance_type_map" {
  description = "EC2 Instance Type"
  type        = map(string)
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}
*/
