# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";


  # Allow nonfree drivers for nvidia
  nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Hardware  
  hardware.nvidia = {
	modesetting.enable = true; #wayland
	powerManagement.enable = true;
	open = false;
	nvidiaSettings = true;
  };
  
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jiputer = {
    isNormalUser = true;
    description = "jiputer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "jiputer";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     #vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     hyprland
     xwayland
     kitty  #term
     waybar #status bar
     sddm
     fuzzel
     firefox
     swww # wall paper
     git
     pywal
     jq
     brightnessctl
     nwg-look
     python27
     python310
     neovim
     capitaine-cursors
     bash-completion  # Smarter autocomplete
     fzf               # Fuzzy finder
     zoxide            # Directory jumping
     navi              # Cheatsheet tool
     starship          # Fancy fast prompt
     blesh
     asusctl
  ];
  nixpkgs.config.permittedInsecurePackages = [
     "python-2.7.18.8"
  ];

  #environment.systemPackages = [ pkgs.blesh ];
  programs.bash.interactiveShellInit = ''
    if [[ -f "${pkgs.blesh}/share/blesh/ble.sh" ]]; then
        source "${pkgs.blesh}/share/blesh/ble.sh" --noattach
    fi
  '';   
  services.displayManager.defaultSession = "hyprland";
  services.dbus.enable = true; #for wayland  
  programs.xwayland.enable = true; #xwayland compatibility
  programs.hyprland.enable = true; 
  services.displayManager.sddm = { 
      enable = true;
      #theme.cursorTheme = "capitaine-cursors";
  };
  # Fonts
  fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  boot.extraModprobeConfig = "options asus_nb_wmi wapf=4";
  
  
  services.asusd = {
    enable = true;
    enableUserService = true;
  };  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
