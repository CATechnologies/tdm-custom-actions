#!/bin/sh
# Copyright © 2018 CA. All rights reserved.  CA Confidential.  Please see License.txt file for applicable usage rights and restrictions.

echo "Custom action - ECHO - print passed parameters"
echo "=============================================="
# Access parameters provided by TDM
echo jobId=$jobId
echo jobTitle=$jobTitle
echo type=$type
echo token=$token
echo connectionProfileName=$connectionProfileName
echo tdmUrl=$tdmUrl
echo outputType=$outputType

# Access User defined variables (as environment variables)
echo "Custom environment parameters"
echo param1=$param1
echo param2=$param2

# Access parameters passed as command line arguments
echo "Custom command-line passed by action wrapper parameters"
echo passed argument 1=$1
echo passed argument 2=$2
echo "================================"
