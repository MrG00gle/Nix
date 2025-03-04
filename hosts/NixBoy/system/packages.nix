{ pkgs, ... }: {
  # Excluding unwanted packeges from Gnome WM
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

  # Enabling Gamemode (Because homemanager do not handles gamemode)
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    git
    neofetch
    nano
    gcc
    ollama
    python312  # collision
    python311  # collision
    python39   # collision
  ];
}
