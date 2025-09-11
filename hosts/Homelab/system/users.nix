{ pkgs, lib, ... }: {

  users = {
    users.admin = {
      isNormalUser = true;
      initialPassword = "12345";
      description = "ServerBoy Admin";
      extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "tty"
      "docker"
      ];
      packages = with pkgs; [];
    };

    users.mrgoogle = {
      createHome = false;
      shell = "/run/current-system/sw/bin/nologin";
    };

    users.guest = {
      createHome = false;
    };

  };

  nix.settings.trusted-users = [ "root" "admin" ];

}
