{ lib, ... }: {

  services.openssh.enable = true; # Enabling SSH

  # Enabling xserver howewer system will use Wayland (Just a qarks of Nixos)
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Virtualization
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;  # enable copy and paste between host and guest

  services.flatpak = {
    enable = true;
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

}