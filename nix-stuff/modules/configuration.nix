{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];       
  nixpkgs.config.allowBroken = true;    
  imports = [
    ./gpu.nix
    ./power-management.nix
    ./hardware-configuration.nix
    #./modules/home-manager.nix
    ./system.nix
    ./gui.nix
    ./user.nix
    ./networking.nix
    ./services.nix
    ./programs.nix
    # ./blesh-configuration.nix
    #<home-manager/nixos>
    #./nvf-configuration.nix
  ];
  system.stateVersion = "25.11"; # Match your install version
}

