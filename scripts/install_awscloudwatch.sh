#!/bin/bash
#install the cloudwatch agent
echo "****** Installing the cloudwatch agent ******"	
sudo yum -y install https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm
#install the cloudwatch logs agent
#sudo yum install -y awslogs
sudo service awslogs start
sudo chkconfig awslogs on