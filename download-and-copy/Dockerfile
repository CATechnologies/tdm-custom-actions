# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
ARG tdmVersion

FROM tdm.packages.ca.com/tdm/action-service:$tdmVersion

#install tools needed at runtime (by download.sh)
RUN apt-get update && apt-get -y install unzip \
    curl \
    ssh && \
    rm -rf /var/lib/apt/lists/* \
           /var/lib/apt

#SSH configuration commands
# !!! After adding your configuration files to conf folder, UNCOMMENT the 3 commands below !!!
#RUN mkdir /root/.ssh
#COPY ["conf/id_rsa","conf/id_rsa.pub","conf/known_hosts","/root/.ssh/"]
#RUN ["chmod", "0400", "/root/.ssh/id_rsa"]

#all the custom logic is in download.sh script
COPY ["src/download.sh","/opt/"]
RUN ["chmod", "+x", "/opt/download.sh"]
ENV PUBLISH_ACTION="/opt/download.sh"