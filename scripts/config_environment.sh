#!/bin/bash
#configure system environment variables
export APPDYNAMICS_CONTROLLER_HOST_NAME=medpro.saas.appdynamics.com
export APPDYNAMICS_CONTROLLER_PORT=443
export APPDYNAMICS_CONTROLLER_SSL_ENABLED=true
export APPDYNAMICS_AGENT_APPLICATION_NAME=Eis
export APPDYNAMICS_AGENT_TIER_NAME=Uat
export APPDYNAMICS_AGENT_NODE_NAME=uattest2
export APPDYNAMICS_AGENT_ACCOUNT_NAME=medpro
export APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=1ovg9ek842xl
export APPDYNAMICS_AGENT_UNIQUE_HOST_ID=uattest2
export APPDYNAMICS_AGENT_BASE_DIR=/opt/appdynamics/javaagent/ver21.4.0.32403
export APPDYNAMICS_SIM_ENABLED=true
export JENKINS_HOME=/var/lib/jenkins
export TOMCAT_HOME=/opt/apache-tomcat-9.0.22
export ZOOKEEPER_HOME=/opt/zookeeper
export SOLR_HOME=/opt/solr-8.2.0
export ANT_HOME=/opt/apache-ant-1.8.4
export JAVA_HOME=/opt/jdk1.8.0_211