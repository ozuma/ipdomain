#!/bin/bash

apikey=$(cat API.KEY)
url=$1

curl -X POST "https://urlscan.io/api/v1/scan/" \
      -H "Content-Type: application/json" \
      -H "API-Key: $apikey" \
      -d "{ \
        \"url\": \"$url\", \"public\": \"on\", \
        \"tags\": [\"phishing\", \"malicious\"] \
      }"
