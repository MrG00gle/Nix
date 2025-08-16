{ config, pkgs, flake-inputs, lib, ... }:
{
  imports = [
    ./home.nix
    ../common/apps/git.nix
    ../common/apps/shell.nix
    ../common/apps/easyeffects.nix
    ../common/desktop/gnome.nix
  ];

  services.flatpak.enable = true;

  # Add a new remote. Keep the default one (flathub)
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub-beta";
    location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.packages = [
    { appId = "app.zen_browser.zen"; origin = "flathub";  }
  ];

  home.packages = with pkgs; [

    # Desktop apps
    firefox
    ungoogled-chromium
    telegram-desktop
    discord
    teams-for-linux
    caprine
    obsidian
    audacity
    vlc
    kdePackages.kdenlive
    helvum
#    gnome-boxes
    virtualbox
    pdfarranger
    wireshark
    qbittorrent
    gnome-extension-manager
    gnome-console
    solaar
    easyeffects
    parabolic

    # Gaming stuff
    bottles
    mission-center
    mangohud
    sidequest
    alvr
    lenovo-legion

    # Coding stuff
#    vscode
    vscodium
    jetbrains.pycharm-community
#    jetbrains.pycharm-professional

    # CLI utils
    fastfetch
    htop
    nvtopPackages.panthor
    nix-index
    unzip
    scrot
    socat
    nmap
    fish
    zsh-powerlevel10k
    nix-output-monitor

    # GNOME extentions
    gnomeExtensions.appindicator
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.dash-to-dock
    gnomeExtensions.auto-move-windows
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.vitals
    gnomeExtensions.search-light
    gnomeExtensions.random-wallpaper

    # Other
    papirus-icon-theme
  ];

}