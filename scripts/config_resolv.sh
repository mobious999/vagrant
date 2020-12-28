#!/bin/bash
#configure dns search domains - working
sudo cp /etc/resolv.conf /etc/resolv.conf.$(date '+%Y-%m-%d,%H:%M:%S')
sudo nmcli con mod "System eth0" ipv4.dns-search "us-east-2.compute.internal aws07.wfl.cloud dev.wfl.cloud qa.wfl.cloud uat.wfl.cloud prod.wfl.cloud wfl.cloud wfdev.local wfprod.local medpro.com healthpn.com" #works after reboot
#restart network service for changes to take affect
sudo systemctl restart network.service
#lab notes
#for lab 10.0.2.16 / wfdev.local
#sudo nmcli connection modify "System eth0" ipv4.dns "10.0.2.15"
#sudo systemctl restart network.service