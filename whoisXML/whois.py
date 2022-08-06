#!/usr/bin/python3
import os
import requests
import sys

API_KEY = os.environ.get('WHOISXML_KEY')
BASE_URL = "https://www.whoisxmlapi.com/whoisserver/WhoisService"
DOMAIN = sys.argv[1]

headers = {
    'Content-Type': 'application/json',
}

get_url = f'{BASE_URL}?apiKey={API_KEY}&domainName={DOMAIN}&outputFormat=JSON'
response = requests.get(get_url, headers=headers)

print(response.text)

