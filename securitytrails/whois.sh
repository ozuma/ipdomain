#!/bin/bash

# ARGV[1] = domain

curl --request GET \
     --url https://api.securitytrails.com/v1/domain/${1}/whois \
     --header "APIKEY: ${TRAILS_KEY}"

