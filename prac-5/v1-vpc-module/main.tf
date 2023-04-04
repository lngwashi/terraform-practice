module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  # VPC Basic Details 

  name            = "vpc-dev"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  # Database Subnets 

  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]

  #create_database_nat_gateway_route = true 
  #create_database_internet_gateway_route = true 

  # NAT Gateways - Outbound Communication 
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters 
  enable_dns_hostnames = true
  enable_dns_support   = true
  public_subnet_tags = {
    Type = "public-subnets"
  }
  private_subnet_tags = {
    Type = "private-subnets"
  }
  database_subnet_tags = {
    Type = "database-subnets"
  }
  tags = {
    Owner       = "John"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "vpc-dev"

  }
}

# Working Folder practice/prac-5/v1-vpc-module

/*
lengw@LAPTOP-7208R0AF MINGW64 ~/Documents/terraform_projects/practice/prac-5/v1-vpc-module (main)
$ terraform init

Initializing the backend...
Initializing modules...
Downloading registry.terraform.io/terraform-aws-modules/vpc/aws 2.78.0 for vpc...
- vpc in .terraform\modules\vpc

Initializing provider plugins...
- Finding hashicorp/aws versions matching ">= 2.70.0"...
- Installing hashicorp/aws v4.61.0...
- Installed hashicorp/aws v4.61.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

*/
