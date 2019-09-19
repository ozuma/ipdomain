#!/bin/bash

rm *.txt
curl -o url.txt https://www.openphish.com/feed.txt
./url2FQDN.sh url.txt > fqdn.txt
./fqdn2ip.sh fqdn.txt | tee host-ip.txt
cut -d' ' -f2 host-ip.txt > ip.txt
./ip2country.sh ip.txt | tee result.txt
echo "---------------------------------"
grep Japan result.txt | sort | uniq

