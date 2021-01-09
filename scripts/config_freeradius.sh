#!/bin/bash
echo "****** Configuring Freeradius ******"
#backup freeradius files first (working)
sudo cp /etc/raddb/sites-enabled/default /etc/raddb/sites-enabled/default.$(date '+%Y-%m-%d,%H:%M:%S')
sudo cp /etc/raddb/clients.conf /etc/raddb/clients.conf.$(date '+%Y-%m-%d,%H:%M:%S')
sudo cp /etc/raddb/users /etc/raddb/users.$(date '+%Y-%m-%d,%H:%M:%S')
sudo cp /etc/raddb/radiusd.conf /etc/raddb/radiusd.conf.$(date '+%Y-%m-%d,%H:%M:%S')
#Perform freeradius configuration - working
###########################################################################################################
#This section configures the secret key for pam authentication for the subnets defined
#The first confiuration sets up localhost so that it can authenticate for testing
#The second configuration represents the networks that will be used for authentication 
sudo cat << 'EOF' > /etc/raddb/clients.conf
client localhost {
        ipaddr  = 127.0.0.1
        netmask = 32            
        secret  = 'SECRET' 
}

client adconnector {
        ipaddr  = <ip-range-of-ad-connector>
        netmask = <netmask-bit>            
        secret  = 'SECRET' 
}
EOF
cd \home\vagrant
sudo git clone https://github.com/LinOTP/linotp-auth-freeradius-perl.git /usr/share/linotp/linotp-auth-freeradius-perl

#This section sets up freeradius for perl authentication
sudo cat << 'EOF' > /etc/raddb/mods-available/perl
perl {
     filename = /usr/share/linotp/linotp-auth-freeradius-perl/radius_linotp.pm
}
EOF

# Activate it by creating a symbolic link to the module
sudo ln -s /etc/raddb/mods-available/perl /etc/raddb/mods-enabled/perl

# freeradius linotp perl config
# The realm from below is the realm defined in the linotp software - 
sudo cat << 'EOF' > /etc/linotp2/rlm_perl.ini
URL=https://localhost/validate/simplecheck
REALM=<your-realm>
Debug=True
SSL_CHECK=False
EOF

# Remove unnecessary configuration files to make sure that only one site is enabled from the configuration from above
#remove the ability to do inner tunnel requests
sudo rm /etc/raddb/sites-enabled/inner-tunnel
#remove the default site
sudo rm /etc/raddb/sites-enabled/default
#remove eap authentication 
sudo rm /etc/raddb/mods-enabled/eap 

# Activate the freeradius linotp virtual host
sudo cp /usr/local/ADConnector-MFA/linotp /etc/raddb/sites-available/
sudo ln -s /etc/raddb/sites-available/linotp /etc/raddb/sites-enabled/linotp



#old configuration left for example
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