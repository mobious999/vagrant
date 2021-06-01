#!/bin/bash
#install Apache Tomcat for the testing
#https://linuxize.com/post/how-to-install-tomcat-9-on-centos-7/
echo "****** Installing Apache Tomcat******"
sudo yum install java-1.8.0-openjdk-devel -y
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
cd /tmp
sudo wget https://ftp.wayne.edu/apache/tomcat/tomcat-9/v9.0.41/bin/apache-tomcat-9.0.41.tar.gz
sudo tar -xf apache-tomcat-9.0.41.tar.gz
sudo mv apache-tomcat-9.0.41 /opt/tomcat/
sudo sudo ln -s /opt/tomcat/apache-tomcat-9.0.41 /opt/tomcat/latest
sudo chown -R tomcat /opt/tomcat
#sudo chown -R tomcat:tomcat /opt/tomcat only use if there's a tomcat group
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
#sudo vi /etc/systemd/system/tomcat.service
sudo su
sudo cat << 'EOF' > /etc/systemd/system/tomcat.service
[Unit]
Description=Tomcat 9 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/jre"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"

Environment="CATALINA_BASE=/opt/tomcat/latest"
Environment="CATALINA_HOME=/opt/tomcat/latest"
Environment="CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms128M -Xmx256M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
sudo systemctl status tomcat

######################################################
#sudo systemctl daemon-reload
#sudo systemctl enable tomcat
#sudo systemctl start tomcat
#sudo systemctl status tomcat
#sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
#sudo firewall-cmd --reload