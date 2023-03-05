#ex. 	sudo docker build . --build-arg file=/path/to/file -t islinked-me:latest
FROM tomcat:jdk8

# ARG tag
ARG file

# RUN rm -rf /usr/local/tomcat/webapps/*
ADD ${file} /root/ROOT.war
ADD run-war.sh /usr/bin/

ENTRYPOINT ["run-war.sh"]