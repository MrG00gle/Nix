{ lib, ... }: {

  services.openssh.enable = true; # Enabling SSH

  # Enabling xserver howewer system will use Wayland (Just a qarks of Nixos)
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # ================================== Remote Desktop RDP server setup ==========================================
  services.gnome.gnome-remote-desktop.enable = true; # 'true' does not make the unit start automatically at boot
  systemd.services.gnome-remote-desktop = { 
    wantedBy = [ "graphical.target" ]; # for starting the unit automatically at boot
  };
  services.displayManager.autoLogin.enable = false;
  services.getty.autologinUser = null;
  
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
  # =============================================================================================================

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

}