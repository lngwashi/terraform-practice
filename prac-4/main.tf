# This is a custom module example and the main.tf is in the same folder as the db, eip, sg, web directories

terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"

      version = "~> 3.0"
    }
  }
}

# Provider Block 
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}

output "PrivateIP" {
  value = module.db.PrivateIP
}

output "PublicIP" {
  value = module.web.pub_ip
}

# Note: cd prac-4 -----→ cd db -----→ cd eip-----→ cd sg-----→ cd web---→ in order to do terraform init ---→
