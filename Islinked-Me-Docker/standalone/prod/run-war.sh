#!/bin/sh
echo "Starting war"
# java -server -Xmx768M -Dgrails.env=prod -Dserver.port=8080 -Dmyserver.url='localhost:8080' -jar ./CoolEngineer-me-0.3.1.war
java -server -Xmx768M -Dgrails.env=prod -Dserver.port=8080 -Dmyserver.url='islinked.me' -DdataSource.url='jdbc:mysql://172.28.0.6:3306/islinked-me' -jar /root/ROOT.war
 
