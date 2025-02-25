{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
    ./home-packages.nix
    ./modules/bundle.nix
  ];
  home-manager.users.mrgoogle = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
  };
}
