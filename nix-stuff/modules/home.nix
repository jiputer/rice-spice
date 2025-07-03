{ config, pkgs, ... }:

{
  home.username = "jiputer";
  home.homeDirectory = "/home/jiputer";
  home.stateVersion = "25.11";

  
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Capitaine Cursors";
      package = pkgs.capitaine-cursors;
      size = 24;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  home.pointerCursor = {
    name = "Capitaine Cursors";
    package = pkgs.capitaine-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    papirus-icon-theme
    capitaine-cursors
    nerd-fonts.jetbrains-mono
    gnome-themes-extra
    neovim
    firefox
    gtk4
    gtk3
  ];
}


