#! /bin/bash 
sudo yum update -y 
sudo yum install -y httpd 
sudo systemctl enable httpd 
sudo service httpd start 
sudo echo '<h1>Welcome to Landmark Technologies</h1>' | sudo tee /var/www/html/index.html 
sudo mkdir /var/www/html/app1 
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Landmark Technologies</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html 
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html 


# Step-07: Access Application 
# Important Note -------→ verify if default VPC security group has a rule to allow port 80. 
# Access index.html 
#http://<PUBLIC-IP>/index.html 
#http://<PUBLIC-IP>/app1/index.html 
# Access metadata.html 
#http://<PUBLIC-IP>/app1/metadata.html 