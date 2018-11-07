#!/bin/bash
# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.

# TDM sets following variables:
# jobId
# jobTitle
# type
# token
# connectionProfileName
# tdmUrl
# outputType

echo "Downloading generated data"
echo "=========================="

echo "Downloading from $tdmUrl/TDMJobService/api/ca/v1/jobs/$jobId/actions/downloadArtifact/"
#REST request to download data (zip)
curl -k -X POST -H "Authorization: Bearer $token" $tdmUrl/TDMJobService/api/ca/v1/jobs/$jobId/actions/downloadArtifact/ > /opt/output.zip
echo "Download done"

unzip -o /opt/output.zip -d /opt

echo "Copying data to host: $targetHost:$targetFolder"
ssh "$targetUser@$targetHost" "mkdir $targetFolder/$jobId"
scp -B /opt/*.CSV "$tagetUser@$targetHost:$targetFolder/$jobId/"
echo "================================"
