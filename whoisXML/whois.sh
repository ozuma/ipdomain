#!/bin/bash

domain=${1}
curl --request GET \
     --url "https://www.whoisxmlapi.com/whoisserver/WhoisService?apiKey=${WHOISXML_KEY}&domainName=${domain}&outputFormat=JSON" \
     --header "Content-Type: application/json"

