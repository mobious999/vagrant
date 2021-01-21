#!/bin/bash
#Configure timezone
echo "****** Activating Rhel Subscription ******"
subscription-manager register
subscription-manager attach
yum install -y openssh wget gcc
#/etc/sudoers file:
#Remove Defaults requiretty