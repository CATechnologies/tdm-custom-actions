# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
ARG tdmVersion=4.7.0.14

FROM tdm/action-service:$tdmVersion

#install tools needed at runtime (by download-and-send-email.sh)
RUN apt-get update && apt-get -y install apt-utils && apt-get -y install unzip && apt-get -y install mailutils && apt-get -y install swaks \
    curl \
    ssh && \
    rm -rf /var/lib/apt/lists/* \
           /var/lib/apt

COPY tdm/TDMActionService.jar /opt/TDMActionService.jar

#all the custom logic is in download-and-send-email.sh script
COPY ["src/download-and-send.sh","/opt/"]
RUN ["chmod", "+x", "/opt/download-and-send.sh"]
ENV PUBLISH_ACTION="/opt/download-and-send.sh"

ENTRYPOINT ["java", "-jar", "TDMActionService.jar"]
