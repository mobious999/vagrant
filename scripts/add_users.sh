#!/bin/bash
#add the radius testuser and set a password - not working
sudo su
sudo useradd testuser
echo "testpass" | passwd --stdin testuser
#logout
#add the standard jenkins user and configure the authorized keys
#sudo useradd -d /var/lib/jenkins jenkins
#echo "jenkins" | passwd --stdin jenkins
#logout
#begin the configuration of the jenkins ssh 
#ssh-keygen -t rsa -C "Jenkins agent key"
#cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
#chmod 600 ~/.ssh/authorized_keys
#logout
#exit

