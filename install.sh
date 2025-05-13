#!/bin/bash

#!/bin/bash

echo " Uncle Ben's Hyprland Installer "
echo

# Define mappings: source => target
declare -A CONFIGS=(
  ["home/hyprland"]="~/.config/hypr"
  ["home/waybar"]="~/.config/waybar"
  ["home/fuzzel"]="~/.config/fuzzel"
  ["home/kitty"]="~/.config/kitty"
)

# Wallpapers
WALLPAPERS_SRC="wallpapers"
WALLPAPERS_DEST="~/Pictures/wallpapers"

# Function to create symlink
link_config() {
  local src=$1
  local dest=$2

  src="$(realpath "$src")"
  dest="${dest/#\~/$HOME}" # expand ~ manually

  echo "Linking $src → $dest"

  mkdir -p "$(dirname "$dest")"

  if [ -e "$dest" ]; then
    read -p "⚠️  $dest exists. Overwrite? (y/n) " choice
    if [ "$choice" != "y" ]; then
      echo " Skipping $dest"
      return
    else
      rm -rf "$dest"
    fi
  fi

  ln -s "$src" "$dest"
  echo " Linked $dest"
}

# Link all configs
for src in "${!CONFIGS[@]}"; do
  dest=${CONFIGS[$src]}
  link_config "$src" "$dest"
done

# Copy wallpapers
echo
echo " Copying wallpapers..."

WALLPAPERS_DEST="${WALLPAPERS_DEST/#\~/$HOME}" # expand ~ manually
mkdir -p "$WALLPAPERS_DEST"
cp -r $WALLPAPERS_SRC/* "$WALLPAPERS_DEST/"

echo " Wallpapers copied to $WALLPAPERS_DEST"

echo
echo " All done! Reload Hyprland (Super+Shift+R) to apply changes!"


