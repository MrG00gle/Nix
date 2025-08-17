 { config, lib, pkgs, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  services.thermald.enable = lib.mkDefault true;  # Cooling management
  hardware.graphics.enable = true;  # Enable OpenGL

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Optimus PRIME Option A: Offload Mode
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
