{ pkgs, ... }: {
  # programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.fish;

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
