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

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Firefox
  programs.firefox.enable = true;
}

