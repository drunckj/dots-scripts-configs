#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    warp-cli connect
    notify-send "Cloudfare-warp" "Connected"
else
    rm $TOGGLE
    warp-cli disconnect
    notify-send "Cloudfare-warp" "Disconnected"
fi

