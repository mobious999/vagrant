#!/bin/bash
#add required utilities
echo "****** Configuring MariaDb for Linotp ******"
mysql_secure_installation <<EOF

y
secret
secret
y
y
y
y
EOF