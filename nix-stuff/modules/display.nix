{config, lib, pkgs, ...}: 

{

#
#  # Enable X11
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
#
#  # Nvidia settings
#  hardware.nvidia = {
#    modesetting.enable = true;
#    powerManagement.enable = true;
#    open = false;
#    nvidiaSettings = true;
#  };
#
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
 
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    open = true;
    # Enable PRIME offloading (AMD renders by default, NVIDIA on-demand)
    prime = {
      offload.enable = true;
      sync.enable = true;
  
      # Get these from `lspci`
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:4:0:0"; # double check this one
    };
  };
  hardware.opengl.enable = true;

}
