#!/usr/bin/python3
import json
import os
import requests
import sys

API_KEY = os.environ.get('TRAILS_KEY')
BASE_URL = "https://api.securitytrails.com/v1/domain/"
DOMAIN = sys.argv[1]

headers = {
    'Content-Type': 'application/json',
    'APIKEY': API_KEY,
}

get_url = f'{BASE_URL}{DOMAIN}/whois'
response = requests.get(get_url, headers=headers)

whois_record = json.loads(response.text)

print(whois_record['expiresDate'])

