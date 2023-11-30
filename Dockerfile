# Use a Tomcat base image
FROM tomcat:9.0.55

MAINTAINER vinod<vinod@gmail.com>

LABEL "Project"="Jenkins"

# Copy the WAR file into the webapps directory
COPY ./**/target/*.jar /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["bin/catalina.sh", "run"]
