#!/bin/bash

sed -E "s@h..ps?://@@" ${1} | sed -E "s@/.*@@" | sort | uniq

