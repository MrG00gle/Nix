{ pkgs, ... }: {
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
    jetbrains.pycharm-community
    jetbrains.pycharm-professional
    
    # CLI utils
    file
    tree
    fastfetch
    htop
    nvtopPackages.panthor
    nix-index
    unzip
    scrot
    ffmpeg
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
