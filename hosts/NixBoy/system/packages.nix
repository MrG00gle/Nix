{ pkgs, ... }: {
  # Excluding unwanted packeges from Gnome WM
  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    gnome-music
    gnome-photos
    gnome-maps
    gnome-console
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

  environment.systemPackages = with pkgs; [];
}
