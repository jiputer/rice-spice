#!/bin/bash

# Reload Hyprland config
hyprctl reload

# Reset wallpaper
swww img ~/rice-spice/wallpapers/horse-moebius.png --transition-type any --transition-duration 2

# Regenerate pywal colors
wal -i ~/rice-spice/wallpapers/horse-moebius.png

# Update Waybar sityle
bash ~/.config/waybar/update-colors.sh

# Restart Waybar cleanly
pkill waybar
sleep 0.5
waybar &

