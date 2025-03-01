{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  users.mrgoogle.home.packages = with pkgs; [
  
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
    gnome-software
    gnome-boxes
    pdfarranger
    wireshark
    qbittorrent
    gnome-extension-manager
    # ptyxis
    gnome-terminal
    
    # Gaming stuff
    bottles
    mission-center
    mangohud
    sidequest

    # Coding stuff
    vscode
    jetbrains.pycharm-community
    jetbrains.pycharm-professional
    gcc
    ollama
    #python312  # collision
    #python311  # collision
    #python39   # collision
    
    # CLI utils
    neofetch
    nano
    file
    tree
    wget
    git
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

    # Other
    papirus-icon-theme
  ];
}
