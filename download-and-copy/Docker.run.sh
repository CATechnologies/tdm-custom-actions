#!/usr/bin/env sh
# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
docker run --rm -it --network tdmweb --hostname action-download --name action-download -e ACTION_SECRET=123 \
 -p 8643:8443 \
 tdm/action-download:1.0
