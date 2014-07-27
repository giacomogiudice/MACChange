#!/bin/sh
# Used at startup to change MAC addresses of devices in list
# Author: Giacomo Giudice

list=`ifconfig | grep flags | awk 'BEGIN { FS=":" } { print $1 }'`;

for dev in $list; do
    prefix=`ifconfig "$dev" | grep ether | cut -d ' ' -f 2 | cut -d ':' -f 1`;
    new="$prefix:"`openssl rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//'`;

    ifconfig "$dev" ether "$new";
    check=`ifconfig "$dev" | grep ether | cut -d ' ' -f 2`; 
    if [ "$new" != "$check" ]; then 
        syslog -s -l Error "Failed to change MAC from $check to $new on $dev";
    else
        syslog -s -l Info "Changed $dev MAC to $new";
    fi
done
