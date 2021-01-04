#!/bin/bash
yum install git epel-release -y
yum localinstall http://linotp.org/rpm/el7/linotp/x86_64/Packages/LinOTP_repos-1.1-1.el7.x86_64.rpm
git clone https://github.com/johnalvero/ADConnector-MFA.git /usr/local/ADConnector-MFA