#!/bin/bash
#add required utilities
#configure all necessary software#
#install and configure freeradius
echo "****** Installing Freeradius ******"
sudo yum install freeradius freeradius-perl freeradius-utils perl-App-cpanminus perl-LWP-Protocol-https perl-Try-Tiny git -y
#sudo cpanm Config::File
#sudo mv /etc/raddb/clients.conf /etc/raddb/clients.conf.back
#sudo mv /etc/raddb/users /etc/raddb/users.back
