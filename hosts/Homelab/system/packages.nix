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
    firefox
  ]);

  environment.systemPackages = with pkgs; [
    wget
    git
    file
    tree
    nano
    nix-output-monitor
    ncdu
    docker
    python310
  ];
}
