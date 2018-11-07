#!/usr/bin/env sh
. ../tdm.version.sh
docker build --build-arg tdmVersion="$tdmVersion" -t tdm/action-echo:1.0 .