#!/bin/bash
#configure Environement Variables
###########################################################################
sudo su
cat << 'EOF' > /etc/profile.d/appd_config.sh
export APPDYNAMICS_CONTROLLER_HOST_NAME=medpro.saas.appdynamics.com
export APPDYNAMICS_CONTROLLER_PORT=443
export APPDYNAMICS_CONTROLLER_SSL_ENABLED=true
export APPDYNAMICS_AGENT_APPLICATION_NAME=Lighthouse
export APPDYNAMICS_AGENT_TIER_NAME=Uat
export APPDYNAMICS_AGENT_NODE_NAME=$(hostname)
export APPDYNAMICS_AGENT_ACCOUNT_NAME=medpro
export APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=1ovg9ek842xl
export APPDYNAMICS_AGENT_UNIQUE_HOST_ID=$(hostname)
export APPDYNAMICS_AGENT_BASE_DIR=/opt/appdynamics/javaagent
export APPDYNAMICS_SIM_ENABLED=true
EOF
chown root:root /etc/profile.d/appd_config.sh
chmod 644 /etc/profile.d/appd_config.sh
##############################################################################

