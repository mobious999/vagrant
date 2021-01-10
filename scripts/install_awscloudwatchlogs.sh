#!/bin/bash
#install the cloudwatch agent
echo "****** Installing the cloudwatch logs agent ******"	
#install the cloudwatch logs agent
cd ~ 
sudo yum install https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm -y


