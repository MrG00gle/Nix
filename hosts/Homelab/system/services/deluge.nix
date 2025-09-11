{ config, lib, pkgs, ... }: {
  # Enable Deluge daemon
  services.deluge = {
    enable = true;
    declarative = true; # Manage configuration declaratively
    openFirewall = true; # Open firewall ports for Deluge
    web = {
      enable = true; # Enable Deluge web interface
      openFirewall = true; # Open firewall port for web interface (default 8112)
      port = 8112; # Default web UI port
    };
    user = "deluge"; # Run Deluge as the 'deluge' user
    group = "deluge"; # Run Deluge as the 'deluge' group
    dataDir = "/var/lib/deluge"; # Directory for Deluge data
    authFile = "/var/lib/deluge/auth"; # Authentication file
    config = {
      download_location = "/mnt/DataSwamp/share/Torrents"; # Where torrents are saved
      download_location_paths_list = [ 
        "/mnt/DataSwamp/share/Games" 
        "/mnt/DataSwamp/share/Media/Shows" 
        "/mnt/DataSwamp/share/Media/Movies" 
        "/mnt/DataSwamp/share/Media/AudioBooks" 
        "/mnt/DataSwamp/share/Media/Music" 
      ];
      max_upload_speed = "11718.0";
      share_ratio_limit = "2.0";
      allow_remote = true; # Allow remote connections (within local network)
      listen_ports = [ 6881 6891 ]; # Ports for BitTorrent traffic
    };
  };

  # # Create the authentication file for Deluge
  # environment.etc."deluge/auth" = {
  #   text = ''
  #     localclient:deluge:10
  #   '';
  #   mode = "0600"; # Secure permissions
  #   user = "deluge";
  #   group = "deluge";
  # };

  # # Ensure the download directory exists with correct permissions
  # systemd.tmpfiles.rules = [
  #   "d /var/lib/deluge/downloads 0770 deluge deluge - -"
  # ];

  # Ensure Nginx can access Deluge
  # users.groups.deluge.members = [ "nginx" ];