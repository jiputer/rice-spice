#!/usr/bin/env bash

echo
echo "  Updating /etc/nixos/configuration.nix and hardware-configuration.nix"

# Link main config files
sudo ln -sf "$(realpath configuration.nix)" /etc/nixos/configuration.nix
sudo ln -sf "$(realpath hardware-configuration.nix)" /etc/nixos/hardware-configuration.nix

# Ensure modules directory exists
sudo mkdir -p /etc/nixos/modules

# Link all .nix files from nix-modules/ to /etc/nixos/modules/
for file in modules/*.nix; do
    filename=$(basename "$file")
    sudo ln -sf "$(realpath "$file")" "/etc/nixos/modules/$filename"
done

echo "All module files linked to /etc/nixos/modules."

# Rebuild system
echo
read -p "⚙️  Rebuild NixOS now? (y/n): " rebuild_choice
if [[ "$rebuild_choice" == "y" ]]; then
    sudo nixos-rebuild switch
    echo "NixOS rebuilt successfully!"
else
    echo "⚠️  Skipping rebuild. Don't forget to run 'sudo nixos-rebuild switch' later!"
fi

