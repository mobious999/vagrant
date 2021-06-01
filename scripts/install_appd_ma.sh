#!/bin/bash
#configure appdynamics machine agent
sudo su
#Uninstall the old appdynamics rpm for the machine agent
sudo rpm -e appdynamics-machine-agent

#Remove all residue under /opt/appdynamics
sudo rm -r /opt/appdynamics
#install the new machine agent 
sudo rpm -ivh appdynamics-machine-agent-21.4.0.3075.x86_64.rpm

#Enable the machine-agent
sudo systemctl enable appdynamics-machine-agent
sudo systemctl start appdynamics-machine-agent
