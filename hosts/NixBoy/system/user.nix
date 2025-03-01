{ pkgs, lib, ... }: {

  programs.fish.enable = lib.mkDefault true; # Setting default Shell to fish (But with lowe priority 1500)

  users = {
    defaultUserShell = lib.mkDefault pkgs.fish; # Setting default Shell to fish (But with lowe priority 1000)

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
