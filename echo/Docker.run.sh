#!/usr/bin/env sh
docker run --rm -it --network tdmweb --hostname action-echo --name action-echo -e ACTION_SECRET=123 \
 -p 8543:8443 \
 tdm/action-echo:1.0
