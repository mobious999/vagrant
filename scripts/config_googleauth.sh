#!/bin/bash
#add required utilities
#configure all necessary software#
echo "****** Configuring Google Authenticator ******"
cd ~
sudo git clone https://github.com/google/google-authenticatorlibpam.git
cd ~/google-authenticator-libpam/
sudo google-authenticator-libpam]# ./bootstrap.sh
sudo google-authenticator-libpam]# ./configure
sudo google-authenticator-libpam]# make
sudo google-authenticator-libpam]# make install


