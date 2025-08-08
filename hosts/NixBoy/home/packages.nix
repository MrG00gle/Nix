{ pkgs, flake-inputs, ... }: {

  imports = [ flake-inputs.flatpaks.homeManagerModules.nix-flatpak ];

  services.flatpak.packages = [
    { appId = "flatpak run app.zen_browser.zen"; origin = "flathub";  }
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
    kdenlive
    helvum
    gnome-boxes
    virtualbox
    pdfarranger
    wireshark
    qbittorrent
    gnome-extension-manager
    gnome-console
    # ptyxis

    # Gaming stuff
    bottles
    mission-center
    mangohud
    sidequest

    # Coding stuff
    vscode
    vscodium
    jetbrains.pycharm-community
    jetbrains.pycharm-professional
    
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
