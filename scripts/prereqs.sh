#!/bin/bash
#add required utilities
#configure all necessary software#
#install cloud init
sudo ​yum -y install cloud-init
#install net utils
sudo yum -y install net-tools
#utility for unpacking zip files
sudo yum -y install unzip
#install python3
sudo yum -y install python3 python3-pip
#update pip3 
sudo pip3 install --upgrade pip
#install base dns utilities 
sudo yum -y install bind-utils
#install git client to be able to clone repositories
sudo yum -y install git
#install chrony for time synchronization
#sudo yum -y install chrony
#install wget
sudo yum -y install wget
#install install epel-release
sudo yum -y install epel-release
#install ansible 
#sudo pip3 install ansible - old command 
sudo yum -y install ansible
#install the aws cli
sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
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