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
    ./blesh-configuration.nix
    #<home-manager/nixos>
    #./nvf-configuration.nix
  ];
        # services.blesh.enable = true;
  system.stateVersion = "25.11"; # Match your install version
}

