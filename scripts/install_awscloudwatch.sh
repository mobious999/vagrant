#!/bin/bash
#install the cloudwatch agent
echo "****** Installing the cloudwatch agent ************************************************"	
sudo yum -y install https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm
echo "****** Finished  Aws Cloudwatch Agent *************************************************"