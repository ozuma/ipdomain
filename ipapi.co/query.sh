#!/bin/bash

# https://ipapi.co/

if [ $# != 1 ]; then
    echo "Usage: ./query.sh <IPADDR>"
    exit 1
fi

curl https://ipapi.co/${1}/json/

# Other examples
#
# $ curl https://ipapi.co/8.8.8.8/country/
# US
#
# $ curl https://ipapi.co/8.8.8.8/city/
# Mountain View
#
# $ curl https://ipapi.co/8.8.8.8/latitude/
# 37.3845
#
# $ curl https://ipapi.co/8.8.8.8/latlong/
# 37.384500,-122.088100
#
# $ curl https://ipapi.co/8.8.8.8/org/
# Google Inc.
