#!/bin/bash

# Document
#  https://ipinfo.io/developers

# Set your token to Environment variable: IPINFO_TOKEN.
TOKEN=${IPINFO_TOKEN}

# Example:
#  $ curl ipinfo.io/8.8.8.8?token=$TOKEN
#  (full details)
#
#  $ curl ipinfo.io/8.8.8.8/org?token=$TOKEN
#  AS15169 Google Inc.

curl -H "Authorization: Bearer $TOKEN" https://ipinfo.io/${1}/${2}?token=${TOKEN}

