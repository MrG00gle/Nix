{ lib, ... }: {

  services.openssh.enable = true; # Enabling SSH

  # Enabling xserver howewer system will use Wayland (Just a qarks of Nixos)
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Virtualization
  # Config for virt-manager
  # services.qemuGuest.enable = true;
  # services.spice-vdagentd.enable = true;  # enable copy and paste between host and guest

  services.flatpak = {
    enable = true;
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

# services.mosquitto = {
#   enable = true;
#   listeners = [
#     {
#       # acl = [ 
#       #   "readwrite home/temp"
#       #   "readwrite home/dev1"
#       #   "readwrite home/dev2"
#       # ];
#       omitPasswordAuth = true;
#       settings.allow_anonymous = true;
#     }
#   ];
# };

# networking.firewall = {
#   enable = true;
#   allowedTCPPorts = [ 1883 ];
# };

}