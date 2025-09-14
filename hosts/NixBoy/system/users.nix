{ pkgs, lib, ... }: {

  users = {
    defaultUserShell = lib.mkForce pkgs.zsh; # Setting default Shell to fish (But with lowe priority 1000)

    users.mrgoogle = {
      isNormalUser = true;
      initialPassword = "12345678";
      description = "MrGoogle";
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "audio"
        "tty"
        "docker"
        "flatpak"
        "plugdev"
        "input"
        "kvm"
        "qemu-libvirtd"
        "libvirtd"
      ];
      packages = with pkgs; []; # Packages are handled by home-manager
    };
  };

  # Config for VirtualBox
  # users.extraGroups.vboxusers.members = [ "mrgoogle" ];

  nix.settings.trusted-users = [ "root" "mrgoogle" ];

  # Enable automatic login for the user.
  # services.getty.autologinUser = "mrgoogle";
}
