#!/bin/bash
#install the cloudwatch agent
echo "****** Installing the cloudwatch logs agent ******"	
#install the cloudwatch logs agent
sudo yum install -y awslogs
sudo service awslogs start
sudo chkconfig awslogs on