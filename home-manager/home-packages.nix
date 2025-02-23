{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  home-manager.users.mrgoogle.home.packages = with pkgs; [
  
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
    
    # Gaming stuff
    bottles
    mission-center
    
    # Coding stuff
    vscode
    jetbrains.pycharm-community
    jetbrains.pycharm-professional
    gcc
    ollama
    python313
    python311
    python310
    python39
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
  ];
}
