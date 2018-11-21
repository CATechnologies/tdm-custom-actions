#!/usr/bin/env sh
# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.
. ../tdm.version.sh
npm install
npm run-script build
docker build -t tdm/db-log:1.0 .