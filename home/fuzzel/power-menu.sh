#!/bin/bash

choice=$(echo -e "  Poweroff\n  Reboot\n  Suspend\n  Logout" | fuzzel --dmenu --font "JetBrainsMono:size=10")

case "$choice" in
    *Poweroff) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Suspend) systemctl suspend ;;
    *Logout) hyprctl dispatch exit ;;
esac

