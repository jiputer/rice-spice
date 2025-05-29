{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];       
  
  imports = [
    
    ./hardware-configuration.nix
    #./modules/home-manager.nix
    ./modules/system.nix
    ./modules/gui.nix
    ./modules/user.nix
    ./modules/networking.nix
    ./modules/services.nix
    ./modules/programs.nix
    #<home-manager/nixos>
  ];

  system.stateVersion = "24.11"; # Match your install version
}

