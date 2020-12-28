#!/bin/bash
#add required utilities
echo "****** Configuring LinOTP ******"
# Configure LinOTP and MariaDB credentials
sudo linotp-create-mariadb
# Lock python-repoze-who version
sudo yum install yum-plugin-versionlock -y
sudo yum versionlock python-repoze-who
# Install apache and vhost config
sudo yum install LinOTP_apache -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.back
sudo mv /etc/httpd/conf.d/ssl_linotp.conf.template /etc/httpd/conf.d/ssl_linotp.conf
#set the admin password
sudo htdigest /etc/linotp2/admins "LinOTP2 admin area" admin

#sudo yum -y update
#sudo yum localinstall http://linotp.org/rpm/el7/linotp/x86_64/Packages/LinOTP_repos-1.1-1.el7.x86_64.rpm -y
#Install MariaDB, enable the service and secure the database. Confirm steps to lockdown MariaDB, like removing the Root privilege for login into MariaDB, or setting Root password to something different.
#sudo yum install mariadb-server -y
#sudo systemctl enable mariadb
#sudo systemctl start mariadb
#sudo mysql_secure_installation
#Install LinOTP, Apache httpd and configure with MariaDB
#sudo yum install -y LinOTP LinOTP_mariadb
#sudo restorecon -Rv /etc/linotp2/
#sudo restorecon -Rv /var/log/linotp
# Configure LinOTP and MariaDB credentials
#sudo linotp-create-mariadb
# Lock python-repoze-who version
#sudo yum install yum-plugin-versionlock -y
#sudo yum versionlock python-repoze-who
# Install apache and vhost config
#sudo yum install LinOTP_apache -y
#udo systemctl enable httpd
#sudo systemctl start httpd
#perform a backup of configuration files
#sudo cp /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.$(date '+%Y-%m-%d,%H:%M:%S')
#sudo mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.back
#sudo cp /etc/httpd/conf.d/ssl_linotp.conf.template /etc/httpd/conf.d/ssl_linotp.conf.template.$(date '+%Y-%m-%d,%H:%M:%S')
#sudo mv /etc/httpd/conf.d/ssl_linotp.conf.template /etc/httpd/conf.d/ssl_linotp.conf
#configure linotp admin password
#sudo htdigest /etc/linotp2/admins "LinOTP2 admin area" admin

