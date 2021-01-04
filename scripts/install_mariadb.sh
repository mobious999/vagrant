#!/bin/bash
#add required utilities
#utility for unpacking zip files
echo "****** Installing MariaDb for Linotp ******"
sudo yum install mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb
#sudo mysql_secure_installation