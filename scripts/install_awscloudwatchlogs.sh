#!/bin/bash
#install the cloudwatch agent
echo "****** Installing the cloudwatch logs agent ******"	
#install the cloudwatch logs agent
cd /home/vagrant
sudo curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O
sudo curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/AgentDependencies.tar.gz -O
sudo tar xvf AgentDependencies.tar.gz -C /tmp/
sudo python ./awslogs-agent-setup.py --region us-east-1 --dependency-path /tmp/AgentDependencies