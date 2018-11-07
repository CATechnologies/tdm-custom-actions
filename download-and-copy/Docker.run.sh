#!/usr/bin/env sh
docker run --rm -it --network tdmweb --hostname action-download --name action-download -e ACTION_SECRET=123 \
 -p 8643:8443 \
 tdm/action-download:1.0
