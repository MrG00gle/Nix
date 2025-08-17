{ pkgs, lib, ... }: {

  programs.fish.enable = lib.mkForce true; # Setting default Shell to fish (But with lowe priority 1500)

  users = {
    defaultUserShell = lib.mkForce pkgs.zsh; # Setting default Shell to fish (But with lowe priority 1000)

    users.vmboy = {
      isNormalUser = true;
      initialPassword = "12345";
      description = "VmBoy";
      extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "tty"
      "docker"
      ];
      packages = with pkgs; []; # Packages are handled by home-manager
    };
  };

  nix.settings.trusted-users = [ "root" "vmboy" ];

  # Enable automatic login for the user.
  # services.getty.autologinUser = "mrgoogle";
}
