#!/bin/sh

UPSTREAM_DNS=${UPSTREAM_DNS:-8.8.8.8}

sed -i s%#server=/localnet/192.168.0.1%server=$UPSTREAM_DNS% /etc/dnsmasq.conf

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
