{ config, pkgs, ... }:

{
  # PipeWire audio stack
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;  # Uncomment if using JACK
  };

  # Printing
  services.printing.enable = true;

  # DBus (for Wayland and general system services)
  services.dbus.enable = true;

  # ASUS laptop support
  boot.extraModprobeConfig = "options asus_nb_wmi wapf=4";
  services.asusd = {
    enable = true;
    enableUserService = true;
  };
}

