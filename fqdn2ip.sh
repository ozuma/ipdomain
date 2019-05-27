#!/bin/bash

for fqdn in $(cat ${1})
do
  host ${fqdn} | awk '/has address/ {print $1,$NF}'
done
