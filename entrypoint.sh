#!/bin/sh

dnsmasq -k &

FILE="/etc/dnsmasq.d/hosts.local"
LAST=`md5sum "$FILE"`
while true; do
  sleep 0.1
  NEW=`md5sum "$FILE"`
  if [ "$NEW" != "$LAST" ]; then
        killall -s SIGHUP dnsmasq
    LAST="$NEW"
  fi
done
