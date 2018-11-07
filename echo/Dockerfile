# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
ARG tdmVersion

FROM tdm.packages.ca.com/tdm/action-service:$tdmVersion

#all the custom logic is in echo.sh script
COPY ["src/echo.sh","/opt/"]
RUN chmod +x "/opt/echo.sh"
ENV PUBLISH_ACTION="/opt/echo.sh cmd_param_1 cmd_param_2"