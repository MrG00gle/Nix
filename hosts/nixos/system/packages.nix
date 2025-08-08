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

  environment.systemPackages = with pkgs; [
    wget
    git
    neofetch
    file
    tree
    nano
    gcc
    gamemode
    go
    rustc
    ollama
    docker
    python312
    python311
    python310
  ];
}
