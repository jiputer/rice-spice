#!/bin/bash

# Paths
WAL_COLORS="$HOME/.cache/wal/colors.json"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"

# Read colors from wal
background=$(jq -r '.special.background' "$WAL_COLORS")
foreground=$(jq -r '.special.foreground' "$WAL_COLORS")
color0=$(jq -r '.colors.color0' "$WAL_COLORS")
color1=$(jq -r '.colors.color1' "$WAL_COLORS")
color2=$(jq -r '.colors.color2' "$WAL_COLORS")
color6=$(jq -r '.colors.color6' "$WAL_COLORS")
color8=$(jq -r '.colors.color8' "$WAL_COLORS")

# Generate a new style.css
cat > "$WAYBAR_STYLE" <<EOF
* {
    border: none;
    border-radius: 10px;
    font-family: "JetbrainsMono Nerd Font";
    font-size: 15px;
    min-height: 10px;
}

window#waybar {
    background: transparent;
}

#network {
    margin-top: 10px;
    margin-left: 8px;
    padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 0px;
    border-radius: 10px;
    transition: none;
    background: $background;
    color: $foreground;
    border-bottom: 3px solid $color1;
    transition: 0.3s;
}

#network:hover { 
    color: $background;
    background: $color1;
}

#custom-keybinds {
    margin-top: 10px;
    margin-left: 8px;
    padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 0px;
    border-radius: 10px;
    transition: none;
    color: $color6;
    background: $color8;
    border-bottom: 3px solid $color6;
    transition: 0.3s;
}
#custom-keybinds:hover { 
    background: $color6;
    color: $background;
}

#cava, #language, #pulseaudio, #clock, #disk, #privacy, #memory, #cpu, #custom-launcher, #custom-power, #workspaces, #tray, #tray menu {
    margin-top: 10px;
    margin-left: 8px;
    padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 0px;
    border-radius: 10px;
    background: $color8;
    color: $color6;
    border-bottom: 3px solid $color6;
    transition: 0.3s;
}

#cava:hover, #language:hover, #pulseaudio:hover, #clock:hover, #disk:hover, #memory:hover, #cpu:hover, #custom-launcher:hover, #custom-power:hover {
    background: $color6;
    color: $background;
}

#cava:hover {
    color: $background;
    background: $color1;
}

#battery, #backlight {
    margin-top: 10px;
    margin-left: 8px;
    padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 0px;
    border-radius: 10px;
    background: $background;
    color: $foreground;
    border-bottom: 3px solid $color1;
    transition: 0.3s;
}

#battery:hover, #backlight:hover {
    color: $background;
    background: $color1;
}

#pulseaudio.muted {
    color: $foreground;
    background: $background;
    border-bottom: 3px solid $color6;
    transition: 0.3s;
}
#pulseaudio.muted:hover {
    background: $color6;
    color: $background;
}

#idle_inhibitor {
    margin-top: 10px;
    margin-left: 8px;
    padding-left: 15px;
    padding-right: 15px;
    margin-bottom: 0px;
    border-radius: 10px;
    background: $color8;
    color: $foreground;
    border-bottom: 3px solid $color1;
    transition: 0.3s;
}

#idle_inhibitor.activated {
    color: $foreground;
    border-color: $color1;
}
#idle_inhibitor.activated:hover, #idle_inhibitor.deactivated:hover {
    background: $color1;
    color: $background;
}

#network.disconnected {
    background: $background;
    color: $foreground;
    border-bottom: 3px solid $color1;
}
#network.disconnected:hover {
    background: $color1;
    color: $background;
}

#workspaces {
    margin-top: 10px;
    margin-left: 8px;
    padding-right: 4px;
    background: $color8;
    color: $color6;
    border-bottom: 3px solid $color6;
    transition: 0.3s;
}

#workspaces button {
    color: $color6;
    transition: 0.3s;
}
#workspaces button:hover {
    background: transparent;
    color: transparent;
    box-shadow: none;
    text-shadow: none;
}

#tray {
    margin-top: 10px;
    margin-left: 8px;
    padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 0px;
    border-radius: 10px;
    background: $color8;
    color: $color6;
    border-bottom: 3px solid $color6;
    transition: 0.3s;
}

#tray menu {
    margin-top: 10px;
    margin-left: 8px;
    padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 0px;
    border-radius: 10px;
    background: $color8;
    color: $color6;
    border-bottom: 3px solid $color6;
    transition: 0.3s;
}

EOF

# Restart waybar
pkill waybar
waybar &

