{ config, pkgs, lib, ... }:
{
  home.username = lib.mkDefault "mrgoogle";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}