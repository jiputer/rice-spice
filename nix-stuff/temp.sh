export GI_TYPELIB_PATH="$(nix eval --raw github:aylur/astal#battery)/lib/girepository-1.0:\
$(nix eval --raw github:aylur/astal#hyprland)/lib/girepository-1.0:\
$(nix eval --raw github:aylur/astal#tray)/lib/girepository-1.0:\
$(nix eval --raw github:aylur/astal#mpris)/lib/girepository-1.0:\
$(nix eval --raw github:aylur/astal#wireplumber)/lib/girepository-1.0"

echo "start"
for path in $(echo "$GI_TYPELIB_PATH" | tr ':' '\n'); do
  echo "--- $path ---"
  ls "$path" | sed 's/-[0-9]*\.typelib$//' | sort | uniq
done

