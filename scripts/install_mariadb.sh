#!/bin/bash
#add required utilities
#utility for unpacking zip files
echo "****** Installing Mariadb ******"
sudo yum install mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation