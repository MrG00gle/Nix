{ lib, pkgs, ... }: {

  # Enable libvirtd for virtualization used for virt-manager
  # virtualisation = {
  #   libvirtd = {
  #     enable = true;
  #     qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  #   };
  #   spiceUSBRedirection = {
  #     enable = true;
  #   };
  # };
  # programs.virt-manager.enable = true;

  # Enable VirtualBox
  virtualisation ={
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest = {
      enable = true;
      dragAndDrop = true;
    };
  };
  
}