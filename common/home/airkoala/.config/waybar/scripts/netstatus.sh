#!/bin/bash

wired_icon=""
wifi_icon=""

ok_icon=""
warn_icon=" "
error_icon=" "
load_icon=""

ival=5
test_host="google.com"

function status {
  if ping -c 2 $test_host &> /dev/null; then
    echo "$ok_icon"
  elif ping -c 2 _gateway &> /dev/null; then
    echo "$warn_icon"
  else
    echo "$error_icon"
  fi
}

function iface {
  ip route get 1.1.1.1 | head -n 1 | rg -o --pcre2 '(?<=dev )\w+'
}

function connection_type {
  local conn_type=$(ip route get 1.1.1.1 | head -n 1 | rg -o --pcre2 '(?<=dev )\w')
  if [ "$(iface | head -c 1)" == 'w' ]; then
    echo "$wifi_icon"
  else
    echo "$wired_icon"
  fi
}

function connection_names {
  nmcli connection show --active |                        # list active connections
    grep -v 'loopback' |                                  # exclude loopbacks
    sed -r 's/ +$//' |                                    # remove trailing spaces
    awk -F ' {2,}' 'NR>1 {print $1" ("$4")"}' ORS='\\r' | # print connection name and device
    head -c -2                                            # remove trailing newline
}

# echo "$load_icon"
while true; do
  echo "{
          \"text\": \"$(connection_type)$(status)\",
          \"tooltip\": \"$(connection_names)\"
        }" | jq --unbuffered --compact-output
  sleep $ival
done
