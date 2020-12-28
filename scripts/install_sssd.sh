#!/bin/bash
echo "****** Installing SSSD ******"
sudo yum install sssd realmd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation -y #openldap-clients policycoreutils-python -y