#!/bin/bash
#add required utilities
#configure all necessary software#
#install and configure freeradius
echo "****** Installing Freeradius ******"
sudo yum install freeradius freeradius-perl freeradius-utils perl-App-cpanminus perl-LWP-Protocol-https perl-Try-Tiny git -y
sudo cpanm Config::File
sudo mv /etc/raddb/clients.conf /etc/raddb/clients.conf.back
sudo mv /etc/raddb/users /etc/raddb/users.back

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

sudo git clone https://github.com/LinOTP/linotp-auth-freeradius-perl.git /usr/share/linotp/linotp-auth-freeradius-perl

sudo cat << 'EOF' > /etc/raddb/mods-available/perl
perl {
     filename = /usr/share/linotp/linotp-auth-freeradius-perl/radius_linotp.pm
}
EOF
# Activate it
sudo ln -s /etc/raddb/mods-available/perl /etc/raddb/mods-enabled/perl

# freeradius linotp perl config
sudo cat << 'EOF' > /etc/linotp2/rlm_perl.ini
URL=https://localhost/validate/simplecheck
REALM=<your-realm>
Debug=True
SSL_CHECK=False
EOF

# Remove unnecessary config
sudo rm /etc/raddb/sites-enabled/inner-tunnel
sudo rm /etc/raddb/sites-enabled/default
sudo rm /etc/raddb/mods-enabled/eap 

# Activate the freeradius linotp virtual host
sudo cp /usr/local/ADConnector-MFA/linotp /etc/raddb/sites-available/
sudo ln -s /etc/raddb/sites-available/linotp /etc/raddb/sites-enabled/linotp