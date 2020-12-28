#!/bin/bash
#configure the jenkins user
#begin jenkins node configuration
sudo yum -y install java-1.8.0-openjdk
sudo su
sudo useradd -d /var/lib/jenkins jenkins
echo "jenkins" | passwd --stdin jenkins
logout
begin the configuration of the jenkins ssh 
ssh-keygen -t rsa -C "Jenkins agent key"
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
logout
exit
