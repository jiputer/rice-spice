{ config, pkgs, ... }:

{
  # Enable X11
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Nvidia settings
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # Input/keymap
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";

  # Wayland & Hyprland
  services.displayManager.defaultSession = "hyprland";
  programs.xwayland.enable = true;
  programs.hyprland.enable = true;

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    # theme.cursorTheme = "capitaine-cursors";
  };

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.mononoki
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only  # good fallback for icons
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
       # sansSerif = [ "Mononoki Nerd Font" ];
       # serif = [ "Mononoki Nerd Font" ];
      };
    };
  };

  
  environment.sessionVariables = {
    
    GDK_SCALE = "1";                  # Optional: fixes scaling issues
    XCURSOR_THEME = "capitaine-cursors-white";
    XCURSOR_SIZE = "30";
    QT_QPA_PLATFORMTHEME = "qt5ct";   # Helps Qt apps respect theme
    };
  

  # Firefox
  programs.firefox.enable = true;
}

