{ config, pkgs, ... }:
{
  imports = [
    ./packages.nix
    ./apps/git.nix
    ./apps/shell.nix
    ./window_managers/gnome.nix
  ];

  home.username = "vmboy";
  home.homeDirectory = "/home/vmboy";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
