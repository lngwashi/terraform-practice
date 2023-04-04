

resource "aws_instance" "ec2" {
  ami             = data.aws_ami.amzlinux2.id
  instance_type   = "t2.mdeium"
  security_groups = [aws_security_group.web-traffic.name]
  tags = {
    "Name" = "Prod_ec2"
  }
}
