# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
FROM container-registry.oracle.com/database/instantclient:12.2.0.1

RUN yum -y update && yum -y install java && \
 curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - && \
 yum -y install nodejs

RUN npm i -g typescript && npm cache verify

WORKDIR /opt

COPY tdm/TDMActionService.jar /opt/TDMActionService.jar

RUN keytool -genkeypair -dname cn=tdm -alias jetty -keypass super-secret -storepass secret -keyalg RSA -keysize 2048 -keystore keystore.jks -validity 3650

COPY ["package.json","tsconfig.json","dist/src/*.js","/opt/"]

RUN npm install

ENV PUBLISH_ACTION="node /opt/db-action.js"

#TDM Action Service - REST
ENTRYPOINT ["java", "-jar", "TDMActionService.jar"]