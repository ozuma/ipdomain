#!/bin/sh

# Thanks to: http://ip-api.com/docs/api:json

for ip in $(cat ${1})
do
  curl -s "http://ip-api.com/json/${ip}?fields=country,query"
  echo
  sleep 2
done
