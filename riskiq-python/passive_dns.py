#!/usr/bin/python3

from passivetotal import analyzer
import sys

args = sys.argv
analyzer.init()
ip = analyzer.IPAddress(args[1])

for record in ip.resolutions:
    print(record.hostname)

