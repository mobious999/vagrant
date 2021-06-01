#!/bin/bash
#configure chrony - working
#backup chrony configuration files
sudo cp /etc/chrony.conf /etc/chrony.conf.$(date '+%Y-%m-%d,%H:%M:%S')
sudo sed -e '/server 0.centos.pool.ntp.org iburst/ s/^#*/#/' -i /etc/chrony.conf #comment out the lines 
sudo sed -e '/server 1.centos.pool.ntp.org iburst/ s/^#*/#/' -i /etc/chrony.conf #comment out the lines 
sudo sed -e '/server 2.centos.pool.ntp.org iburst/ s/^#*/#/' -i /etc/chrony.conf #comment out the lines 
sudo sed -e '/server 3.centos.pool.ntp.org iburst/ s/^#*/#/' -i /etc/chrony.conf #comment out the lines 
echo '#Add Aws Server' $(date) | sudo tee -a /etc/chrony.conf
echo '#modified on ' $(date) | sudo tee -a /etc/chrony.conf
echo 'server 169.254.169.123 prefer iburst minpoll 4 maxpoll 4' | sudo tee -a /etc/chrony.conf
#sudo sed '/*3.centos*/ a\server 169.254.169.123 prefer iburst minpoll 4 maxpoll 4' /etc/chrony.conf #not working
sudo systemctl start chronyd
sudo systemctl enable chronyd
sudo chronyc makestep