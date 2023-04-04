
# Modules enable us to re-use our code. Is always place outside the modules block as seen in prac-3 folder

# Terraform Block 
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Provider Block 
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
# module Block 
module "modules" {
  source = "./ec2" # i.e the ec2 directory above 
  myapp  = "Demo ec2"
}
output "module_output" {
  value = module.modules.instance_id
}
