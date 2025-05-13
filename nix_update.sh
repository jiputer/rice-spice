# Link system configuration.nix
echo
echo "🛠️  Updating /etc/nixos/configuration.nix and hardware-configuration.nix"

sudo ln -sf "$(realpath configuration.nix)" /etc/nixos/configuration.nix
sudo ln -sf "$(realpath hardware-configuration.nix)" /etc/nixos/hardware-configuration.nix

echo "✅ System configuration linked."

# Rebuild system
echo
read -p "⚙️  Rebuild NixOS now? (y/n): " rebuild_choice
if [[ "$rebuild_choice" == "y" ]]; then
    sudo nixos-rebuild switch
    echo "✅ NixOS rebuilt successfully!"
else
    echo "⚠️  Skipping rebuild. Don't forget to run 'sudo nixos-rebuild switch' later!"
fi

