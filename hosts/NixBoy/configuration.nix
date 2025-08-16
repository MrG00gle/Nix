{ inputs, config, pkgs, lib, ...}: 
# let
#   modulePaths = lib.attrNames (import ./system);
# in
{
  imports = [
    ./hardware-configuration.nix
    ./system/fonts.nix
    ./system/gpu.nix
    ./system/locales.nix
    ./system/network.nix
    ./system/packages.nix
    ./system/services.nix
    ./system/sound.nix
    ./system/bluetooth.nix
    ./system/store.nix
    ./system/users.nix
  ]; #++ (lib.mapAttrsToList (name: path: import path) modulePaths);
  
  # Bootloader.
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = lib.mkForce true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  services.printing.enable = false;  # Printer

  time.timeZone = "Europe/Warsaw";

  system.stateVersion = "25.05";
}
