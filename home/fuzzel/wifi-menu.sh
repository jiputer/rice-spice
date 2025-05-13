#!/bin/bash

# List available networks, cut headers, pick network
SSID=$(nmcli -f SSID,SECURITY device wifi list | sed 1d | awk '{print $1}' | fuzzel --dmenu --font "JetBrainsMono:size=10" --prompt "WiFi> ")

# If user picked something
if [[ -n "$SSID" ]]; then
    nmcli device wifi connect "$SSID"
fi

