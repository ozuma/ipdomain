#!/bin/bash

# $1 => IPaddr
# $2 => Categories (comma separated). e.g.) Phishing:7
# $3 => comment

curl https://api.abuseipdb.com/api/v2/report \
  --data-urlencode "ip=${1}" \
  -d categories=${2} \
  --data-urlencode "comment=${3}" \
  -H "Key: ${ABUSEIPDB_KEY}" \
  -H "Accept: application/json"

