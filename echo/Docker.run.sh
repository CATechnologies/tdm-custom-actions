#!/usr/bin/env sh
# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
docker run --rm -it --network tdmweb --hostname action-echo --name action-echo -e ACTION_SECRET=123 \
 -p 8543:8443 \
 tdm/action-echo:1.0
