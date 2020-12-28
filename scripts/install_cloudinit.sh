#!/bin/bash
#add required utilities
echo "****** Provisioning virtual machine... ******"
sudo wget http://dl.fedoraproject.org/pub/epel/7Server/ppc64/Packages/e/epel-release-7-11.noarch.rpm 
sudo rpm -Uvh epel-release-7*.rpm
sudo yum localinstall
sudo rpm –i cloud-init-0.7.5-8.el6.centos.2.x86_64.rpm
