{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    hyprland
    xwayland
    kitty
    waybar
    sddm
    fuzzel
    firefox
    swww
    git
    pywal
    jq
    brightnessctl
    nwg-look
    python27
    python310
    neovim
    capitaine-cursors
    bash-completion
    fzf
    zoxide
    navi
    starship
    blesh
    asusctl
    grim
    slurp
    wl-clipboard
  ];

 # programs.bash.interactiveShellInit = ''
 #   if [[ -f "${pkgs.blesh}/share/blesh/ble.sh" ]]; then
 #     source "${pkgs.blesh}/share/blesh/ble.sh" --noattach
 #   fi
 #  '';
}

