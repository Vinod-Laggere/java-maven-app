FROM ubuntu:20.04

MAINTAINER vinod<vinod@gmail.com>

LABEL "Project"="Jenkins"

RUN apt-get update && apt-get install -y openjdk-11-jdk && apt-get install -y wget

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz &&  tar -zxvf apache-tomcat-9.0.50.tar.gz

WORKDIR /apache-tomcat-9.0.50

COPY Amazon.war webapps/

EXPOSE 8080

CMD ["bin/catalina.sh", "run"]
