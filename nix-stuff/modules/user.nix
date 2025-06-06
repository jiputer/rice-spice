{ config, pkgs, ... }:

{
  users.users.jiputer = {
    isNormalUser = true;
    description = "jiputer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };
  #services.displayManager.autoLogin
  # Auto-login setup
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jiputer";

  # Workaround for GNOME autologin
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}

