#!/bin/bash
source API_URL.sh
curl -s -u ${RISKIQ_USER}:${RISKIQ_KEY} ${API_URL}/v2/account

