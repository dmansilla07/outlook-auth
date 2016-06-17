FROM tomcat:8-jre8

MAINTAINER "dmansilla07 <dmansilla07@gmail.com">

ADD C:\Xinef\outlook-auth\outlook-auth\outlook-auth\target\outlook-auth-0.0.1-SNAPSHOT.war C:\Xinef\outlook-auth\outlook-auth\outlook-auth\apache-tomcat-8.0.35\webapps\outlook-auth-0.0.1-SNAPSHOT.war
