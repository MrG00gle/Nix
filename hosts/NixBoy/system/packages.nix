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
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    git
    file
    tree
    nano
    nix-output-monitor
    pciutils
    mesa-demos
    gcc
    go
    rustc
    ollama
    docker
    python311Full
    python311Packages.pyqt5
    python311Packages.numpy
    python311Packages.pyserial
    python311Packages.pyyaml
    python311Packages.pyvista
    python311Packages.pandas
    python311Packages.pyaml

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
