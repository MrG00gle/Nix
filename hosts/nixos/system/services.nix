{ lib, ... }: {
  services.openssh.enable = true; # Enabling SSH

  # Enabling xserver howewer system will use Wayland (Just a qarks of Nixos)
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.flatpak.enable = true;
  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = false;

}