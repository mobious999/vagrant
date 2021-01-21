#!/bin/bash
#install the ssm agent
echo "****** Installing Aws SSM Agent ******"
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
echo "****** Done Installing Aws SSM Agent ******"