#!/bin/bash
#install Epel Packages
echo "****** Installing Epel ******"
cd /home/vagrant
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
