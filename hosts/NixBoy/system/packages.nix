{ pkgs, ... }: {
  # Excluding unwanted packages from Gnome Window Manager
  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    yelp
    gnome-software
    gnome-characters
    gnome-contacts
    gnome-music
    gnome-photos
    gnome-maps
    gnome-boxes
    geary # mail client
    epiphany # gnome browser
    gnome-tour
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ]);

  # Enabling Gamemode (Because HomeManager do not handles gamemode)
  programs.gamemode.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    # System tools
    git
    wget
    curl
    file
    tree
    ffmpeg
    pciutils
    mesa-demos

    # Virtualization
    qemu
    # libvirt
    
    # Editors
    nano

    # Services
    ollama
    docker
    
    # Status bars and monitors
    fastfetch
    htop
    btop
    nvtopPackages.full
    ncdu

    # Nix tools
    nix-output-monitor

    # Programming languages and libraries
    gcc
    go
    rustc
    python311Full

  ];

  # programs.nix-ld = {
  #   enable = true;
  #   libraries = with pkgs; [
  #     glib # conteins(libglib-2.0.so.0, libgthread-2.0.so.0)
  #     glibc
  #     zlib
  #   ];
  # };

}
