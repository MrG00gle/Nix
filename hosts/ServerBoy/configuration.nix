{ config, pkgs, ... }:{
  
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./disko.nix
      ./system/fonts.nix
      ./system/locales.nix
      ./system/network.nix
      ./system/packages.nix
      ./system/services/services.nix
      ./system/sound.nix
      ./system/bluetooth.nix
      ./system/store.nix
      ./system/users.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Did you read the comment?

}
