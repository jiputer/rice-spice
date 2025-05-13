#!/bin/bash

# set walllpaper

swww img ~/rice-spice/wallpapers/horse-moebius.png
wal -i ~/rice-spice/wallpapers/horse-moebius.png

#bash ~/.config/waybar/update-colors.sh
echo Setting waybar colors
cat ~/.cache/wal/colors-waybar.css ~/.config/waybar/style.css > ~/.config/waybar/style_temp.css
mv ~/.config/waybar/style_temp.css ~/.config/waybar/style.css
