#!/bin/bash

ip=$(curl -s ipinfo.io/ip)
city=$(curl -s "https://ipapi.co/${ip}/json" | jq '.["city"]' | sed 's/"//g')

curl -s wttr.in/$city?\&format=1 | sed 's/\s\+/ /' | sed 's/+//'

