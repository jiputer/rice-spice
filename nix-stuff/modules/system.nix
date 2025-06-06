{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Locale and time
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Allow nonfree drivers
  nixpkgs.config.allowUnfree = true;

  # Permit insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.8"
  ];

  # State version moved to configuration.nix root
}

