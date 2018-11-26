#!/usr/bin/env sh
# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
. ../tdm.version.sh
docker build --build-arg tdmVersion="$tdmVersion" -t tdm/action-download-send:1.0 .