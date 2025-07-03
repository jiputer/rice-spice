#
#{ config, pkgs, ags, astal, astalBattery, astalNetwork, astalBluetooth, astalMpris, astalWp, astalTray, astalHyprland, nvfNeovim, ... }:
{ config, pkgs, nvfNeovim, ... }:



{
  environment.systemPackages = with pkgs; [
    wget
    hyprland
    xwayland
    fastfetch
    kitty
    waybar
    kdePackages.sddm
    fuzzel
    firefox
    swww
    git
    pywal
    jq
    brightnessctl
    nwg-look
    home-manager

    python27
    python310
    
    vim
    neovim
    nvfNeovim

    acpi   
    fzf
    zoxide
    navi
    starship
    blesh
    asusctl
    grim
    slurp
    wl-clipboard
    gcc
    gnumake
    cmake
    pkg-config
    libGL
    libGLU
    freeglut
    SDL2
    xorg.libX11
    xorg.libXrandr
    xorg.libXext
    xorg.libXxf86vm
    linuxHeaders
    v4l-utils
    ffmpeg
    spotify    
    cava
     
    # themes, fonts
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
    papirus-icon-theme 
    capitaine-cursors
    noto-fonts-emoji
    

    # gui
    gtk3
    gtk4
    gjs
    wrapGAppsHook
    gobject-introspection
    astal.astal4
    astal.astal3
    astal.io
    astal.battery
    astal.network
    astal.bluetooth
    astal.mpris
    astal.wireplumber
    # astal.tray #has an error in building 
    astal.hyprland
    ags
    glib 
    upower

    gdm
    lightdm
    cliphist
    gnome-bluetooth
    gobject-introspection
    gpu-screen-recorder
    grimblast
    hypridle
    hyprlock
    hyprpicker
    hyprshot
    hyprsunset
    imagemagick
    libnotify
    playerctl
    swappy
    tesseract
    tmux
    uwsm
  
    # battery management
    tlp
];
}

