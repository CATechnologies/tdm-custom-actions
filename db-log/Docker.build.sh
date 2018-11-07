#!/usr/bin/env sh
. ../tdm.version.sh
npm run-script build
docker build -t tdm/db-log:1.0 .