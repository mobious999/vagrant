#!/bin/bash
#configure system environment variables
sudo su
#unpack the files
unzip AppServerAgent-1.8-21.4.0.32403.zip -d /tmp/javaagent

#Prepare the application directory for the java agent
sudo mkdir /opt/appdynamics/javaagent

#move the java agent application files to the /opt/javaagent
sudo mv /tmp/javaagent/ver21.4.0.32403/* /opt/appdynamics/javaagent 

#Grant the user that runs tomcat access to the java agent directory
sudo chown -R eis:eis /opt/appdynamics/javaagent 
sudo chmod -R 750 /opt/appdynamics/javaagent

#add the command to apache to load the appdynamics agent on startup.
echo 'export CATALINA_OPTS="$CATALINA_OPTS -javaagent:/opt/appdynamics/javaagent/javaagent.jar"' >> /opt/apache-tomcat-9.0.22/bin/setenv.sh
