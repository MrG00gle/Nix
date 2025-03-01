{ pkgs, lib, ... }: {

  programs.fish.enable = lib.mkOptionDefault true; # Setting default Shell to fish (But with lowest priority 1500)

  users = {
    defaultUserShell = lib.mkOptionDefault pkgs.fish; # Setting default Shell to fish (But with lowest priority 1500)

    users.mrgoogle = {
      isNormalUser = true;
      description = "mrGoogle";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" "tty" "docker"];
      packages = with pkgs; []; # Packages are handled by home-manager
    };
  };

  # Enable automatic login for the user.
  # services.getty.autologinUser = "mrgoogle";
}
