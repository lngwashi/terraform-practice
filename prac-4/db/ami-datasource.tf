# Example2: Create a db = database as a module, an eip = elastic ip as a module, a sg = security group as a module and lastly web as a module. So, we will have 4 modules + server-script.sh and main.tf

# Get latest AMI ID for Amazon Linux2 OS 
data "aws_ami" "amzlinux2" { 
most_recent = true 
owners = ["amazon"] 
filter { 
name = "name" 
values = ["amzn2-ami-hvm-*-gp2"] 
} 
filter { 
name = "root-device-type" 
values = ["ebs"] 
} 
filter { 
name = "virtualization-type" 
values = ["hvm"] 
} 
filter { 
name = "architecture" 
values = ["x86_64"] 
} 
} 