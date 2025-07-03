{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];       

  imports = [
    ./gpu.nix
    ./power-management.nix
    ./hardware-configuration.nix
    ./system.nix
    ./gui.nix
    ./user.nix
    ./networking.nix
    ./services.nix
    ./programs.nix

  ];
 
  system.stateVersion = "25.11"; # Match your install version
   
}

