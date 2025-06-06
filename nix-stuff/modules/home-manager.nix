{ config, pkgs, ... }:

{
  home.username = "jiputer";
  home.homeDirectory = "/home/jiputer";
  home.stateVersion = "23.11";

  programs.zsh.enable = true;

  home.packages = with pkgs; [
    neovim
    firefox
  ];
}


