{ config, lib, pkgs, ... }: {
  services.audiobookshelf = {
    enable = true;
    services.audiobookshelf.openFirewall = true;
    services.audiobookshelf.host = "127.0.0.1";  # Default 127.0.0.1
    services.audiobookshelf.port = 3004;  # Default 8000
  };
}