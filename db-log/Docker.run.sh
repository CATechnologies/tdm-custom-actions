#!/usr/bin/env sh
docker run --rm -it --network tdmweb --hostname db-log --name db-log -e ACTION_SECRET=123 \
 -e dbHost=database \
 -e dbUser=TRAVEL \
 -e dbPassword=marmite \
 -e dbService=orcl \
 -p 8643:8443 \
 tdm/db-log:1.0
