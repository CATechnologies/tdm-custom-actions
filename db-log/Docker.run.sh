#!/usr/bin/env sh
# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
docker run --rm -it --network tdmweb --hostname action-db-log --name action-db-log -e ACTION_SECRET=123 \
 -e dbHost=database \
 -e dbUser=TRAVEL \
 -e dbPassword=marmite \
 -e dbService=orcl \
 -p 8643:8443 \
 tdm/action-db-log:1.0
