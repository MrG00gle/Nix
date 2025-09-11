{ lib, config, ... }: {
  # Immich photo and video self-hosted server (https://wiki.nixos.org/wiki/Immich)
  users.users.immich.extraGroups = [ "video" "render" ];
  services.immich = {
    enable = true;
    port = 2283;            # TODO: change to more appropriate port later
    openFirewall = true;
    mediaLocation = "/mnt/DataSwamp/share/Media/Immich";
    accelerationDevices = null;
    newVersionCheck.enabled = true;
  };
}