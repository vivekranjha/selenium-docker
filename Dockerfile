FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

#Workspace
WORKDIR /usr/share/udmey

# Add .jar file from host into image

ADD target/selenium-docker.jar        selenium-docker.jar
ADD target/selenium-docker-tests.jar  selenium-docker-tests.jar
ADD target/libs                       libs

# Add suite files 
#incase other dependency like .csv / .json / .xls

ADD book-flight-module.xml    book-flight-module.xml
ADD search-module.xml         search-module.xml

ADD healthcheck.sh healthcheck.sh

#BROWSER
#HUB_HOST
#MODULE

ENTRYPOINT sh healthcheck.sh




