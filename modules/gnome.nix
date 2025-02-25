{ pkgs, lib, ... }: {
  
  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    gnome-music
    gnome-photos
    epiphany # gnome browser
    gnome-tour
    cheese
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ]);
  
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.dconf.profiles = {
    # TODO: Investigate dconf.profiles (https://github.com/Electrostasy/dots/blob/c62895040a8474bba8c4d48828665cfc1791c711/profiles/system/gnome/default.nix#L123-L287)
    mrgoogle.databases = [{
      settings = with lib; {
        
      }
    }]
  }

}
