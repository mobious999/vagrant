#!/bin/bash
#add required utilities
echo "****** Provisioning virtual machine... ******"
#install net utils
sudo yum install net-tools -y
#utility for unpacking zip files
sudo yum install unzip -y
#install python3
sudo yum install python3 python3-pip -y 
#update pip3 
sudo pip3 install --upgrade pip
#install base dns utilities 
sudo yum install bind-utils -y
#install git client to be able to clone repositories
sudo yum install git -y 
#install wget
sudo yum install wget -y 
#install install epel-release
sudo yum install epel-release -y 
#install ansible 
#sudo pip3 install ansible - old command 
sudo yum install ansible -y 
#install the aws cli
sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
#unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
#install the ssm agent
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
#install the cloudwatch agent	
sudo yum -y install https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm
#install the cloudwatch logs agent
sudo yum install -y awslogs
sudo service awslogs start
sudo chkconfig awslogs on
#update the system to the current as of this date
#sudo yum -y update