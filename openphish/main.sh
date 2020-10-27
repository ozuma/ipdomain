#!/bin/bash

target_country="Japan"

rm *.txt
curl -O https://www.openphish.com/feed.txt
head -n 2500 feed.txt | grep -v appspot.com > url.txt

./url2FQDN.sh url.txt | sort | uniq > fqdn.txt
./fqdn2ip.sh fqdn.txt | tee host-ip.txt
cut -d' ' -f2 host-ip.txt > ip.txt
./ip2country.sh ip.txt | tee result.txt
echo "---------------------------------"
grep $target_country result.txt | sort | uniq

