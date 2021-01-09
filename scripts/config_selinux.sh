#!/bin/bash
#configure selinux for otp
sudo yum install policycoreutils-python -y
sudo semanage fcontext -a -t httpd_sys_content_t "/etc/linotp2(/.*)?"
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/etc/linotp2/data(/.*)?"
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/log/linotp(/.*)?"