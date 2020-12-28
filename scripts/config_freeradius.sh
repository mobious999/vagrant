#!/bin/bash
echo "****** Configuring Freeradius ******"
#backup freeradius files first (working)
sudo cp /etc/raddb/sites-enabled/default /etc/raddb/sites-enabled/default.$(date '+%Y-%m-%d,%H:%M:%S')
sudo cp /etc/raddb/clients.conf /etc/raddb/clients.conf.$(date '+%Y-%m-%d,%H:%M:%S')
sudo cp /etc/raddb/users /etc/raddb/users.$(date '+%Y-%m-%d,%H:%M:%S')
sudo cp /etc/raddb/radiusd.conf /etc/raddb/radiusd.conf.$(date '+%Y-%m-%d,%H:%M:%S')
#Perform freeradius configuration - working
###########################################################################################################
#Change authentication mode to use pam - 
#sudo sed -i "s/^#\\tpam/\\tpam/" /etc/raddb/sites-enabled/default - suspect
###########################################################################################################
#Create a symbolic link to the configuration file - working
#sudo ln -s /etc/raddb/mods-available/pam /etc/raddb/mods-enabled/pam 
########################################################################################################### 
#Not the problem
#Add client configuration to client.conf, ipaddr should be ip address of domain controllers
#sudo vi /etc/raddb/clients.conf
#client virtualbox-nat {
#  ipaddr          = 10.0.2.0/24
#  secret          = testing123
#  require_message_authenticator = no
#  nas_type = other
# }
#echo '#Add Aws Network for Authentication' | sudo tee -a /etc/raddb/clients.conf
#echo '#modified on ' $(date) | sudo tee -a /etc/raddb/clients.conf
#echo 'client virtualbox-nat {' | sudo tee -a /etc/raddb/clients.conf
#echo '  	ipaddr          = 10.0.2.0/24' | sudo tee -a /etc/raddb/clients.conf
#echo '  	secret          = testing123' | sudo tee -a /etc/raddb/clients.conf
#echo '  	require_message_authenticator = no' | sudo tee -a /etc/raddb/clients.conf
#echo '  	nas_type = other' | sudo tee -a /etc/raddb/clients.conf
#echo '}' | sudo tee -a /etc/raddb/clients.conf
###########################################################################################################  
#Update default authentication type
#sudo vi /etc/raddb/users
#DEFAULT Group == "radius-disabled", Auth-Type := Reject
#Reply-Message = "Your account has been disabled."
#DEFAULT Auth-Type := PAM
#sudo sed -i '/Auth-Type := Reject/s/^#//g' /etc/raddb/users #removes the comment from the line
#sudo sed -i '/Your account has been disabled/s/^#//g' /etc/raddb/users #removes the comment from the line
#have to manually add this line after
#sudo sed '/Reply-Message = "Your account has been disabled*/ a\DEFAULT Auth-Type := PAM' /etc/raddb/users #append the line 
########################################################################################################### 
#configure the user that the radius server runs under #must run under root
#must be there to allow access to google authenticator - yeck
#sudo vi /etc/raddb/radiusd.conf - working
#sed -i 's/user\ =\ radiusd/user\ =\ root/; s/group\ =\ radiusd/group\ =\ root/' /etc/raddb/radiusd.conf	 #working 
#start freeradius
#sudo systemctl status radiusd
#sudo systemctl start radiusd
#sudo systemctl enable radiusd
#sudo systemctl restart radiusd