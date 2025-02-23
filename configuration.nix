{ inputs, config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/bundle.nix
  ];
  
    # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  services.printing.enable = false;  # Printer

  time.timeZone = "Europe/Warsaw";

  system.stateVersion = "24.11"; # Don't change it bro
}
