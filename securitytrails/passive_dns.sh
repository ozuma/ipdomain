#!/bin/bash

# ARGV[1] = IPaddress

for i in {1..1}
do
curl --request POST \
     --url "https://api.securitytrails.com/v1/domains/list?include_ips=false&page=${i}&scroll=false" \
     --header "APIKEY: ${TRAILS_KEY}" \
     --header 'Content-Type: application/json' \
     --data @- <<EOF
{
     "query": "ipv4 = '${1}'"
}
EOF
done

