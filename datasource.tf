# ami-datasource.tf - Define Get Latest AMI ID for Amazon Linux2 OS 


data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
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

# Reference DataSource to get the latest AMI ID 
#ami = data.aws_ami.amzlinux2.id i.e 
resource "aws_instance" "ec2" { # resource block 
  ami             = data.aws_ami.amzlinux2.id
  instance_type   = var.my_instance_type
  security_groups = [aws_security_group.web-traffic.name]
  tags = {
    "Name" = "Prod_ec2"
  }
}


/*
OR

# EC2 Instance #---→ ec2.tf 

resource "aws_instance" "myec2vm" { 
ami = data.aws_ami.amzlinux2.id 
instance_type = var.instance_type 
user_data = file("${path.module}/app1-install.sh") 
key_name = var.instance_keypair 
vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id] 
tags = { 
"Name" = "EC2 Demo 2" 
} 
} 

*/
