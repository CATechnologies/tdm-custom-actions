#!/usr/bin/env sh
. ../tdm.version.sh
docker build --build-arg tdmVersion="$tdmVersion" -t tdm/action-download:1.0 .