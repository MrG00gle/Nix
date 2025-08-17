{ config, pkgs, lib, ... }:
{
  home.username = lib.mkDefault "vmboy";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}