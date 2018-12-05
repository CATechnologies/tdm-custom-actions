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
# recipientEmail
# senderEmail
# server

# These variables are set in docker-compose file
# port
# IP address

echo "Downloading generated data"
echo "=========================="

echo "Downloading from $tdmUrl/TDMJobService/api/ca/v1/jobs/$jobId/actions/downloadArtifact/"
#REST request to download data (zip)
curl -k -X POST -H "Authorization: Bearer $token" $tdmUrl/TDMJobService/api/ca/v1/jobs/$jobId/actions/downloadArtifact/ > /opt/output.zip
echo "Download done"

echo "Sending data in zip to email address: $recipientEmail"
swaks -n --to $recipientEmail --from=$senderEmail -p $smtpPort --server $smtpHost --body "$jobTitle and it's ID is $jobId" --header "[TDM JOB] Data Generated $jobId - $jobTitle" --attach /opt/output.zip
echo "==================================================="
