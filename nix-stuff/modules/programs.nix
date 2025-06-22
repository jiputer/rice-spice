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
    
    python27
    python310
    
    vim
    neovim
    nvfNeovim

    capitaine-cursors
    #bash-completion
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
    
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
     
    # gui 
    gjs    
                # astal.io
                #astal.battery
                #astal.network
                #astal.bluetooth
                # astal.mpris
                #astal.wireplumber
                #astal.tray
                #astal.hyprland
                #ags
    gobject-introspection

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
    noto-fonts-emoji
    #nvtop
    playerctl
    swappy
    #swww
    tesseract
    tmux
    uwsm 
  
    # battery
    tlp
];

}

