{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.jiputer = {
    home.stateVersion = "24.11";
    programs.zsh.enable = true;
  };
}

