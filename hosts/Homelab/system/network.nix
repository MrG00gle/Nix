{

  networking.networkmanager.enable = true;
  networking.hostName = "Homelab";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80  # For Nginx HTTP
      443
      8112 6881 6891  # For Deluge
      2283 # For Immich
      3000 # For Aduard
      3004 # For Audiobookshelf
    ];
  };


}
