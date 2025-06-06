{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];       
  
  imports = [
    
    ./hardware-configuration.nix
    #./modules/home-manager.nix
    ./system.nix
    ./gui.nix
    ./user.nix
    ./networking.nix
    ./services.nix
    ./programs.nix
    #<home-manager/nixos>
    #./nvf-configuration.nix
  ];

  system.stateVersion = "24.11"; # Match your install version
}

