#!/usr/bin/env sh
# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
docker run --rm -it --network tdmweb --hostname action-download-send --name action-download-send -e ACTION_SECRET=123 \
 -e smtpPort=2525 \
 -e smtpHost=novmi05w10a.ca.com \
-p 8543:8443 \
 tdm/action-download-send:1.0
