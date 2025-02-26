{ pkgs, ... }: {
  # programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.mrgoogle = {
      isNormalUser = true;
      description = "mrGoogle";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" "tty" "docker"];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  # services.getty.autologinUser = "mrgoogle";
}
