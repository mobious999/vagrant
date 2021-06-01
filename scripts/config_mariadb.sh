#!/bin/bash
#add required utilities
echo "****** Configuring MariaDb for Linotp ******"
mysql_secure_installation <<EOF

y
secret
secret
y
y
y
y
EOF

#Questions answered in this command set
#Enter current password for root (enter for none):
#Set root password? [Y/n]
#New password:
#Re-enter new password:
#Remove anonymous users? [Y/n]
#Disallow root login remotely? [Y/n]
#Remove test database and access to it? [Y/n]
#Reload privilege tables now? [Y/n]