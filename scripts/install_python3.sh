#!/bin/bash
#add required utilities
#install python3
echo "****** Installing Python 3 ******"
sudo yum install python3 python3-pip -y 
#update pip3 
sudo pip3 install --upgrade pip