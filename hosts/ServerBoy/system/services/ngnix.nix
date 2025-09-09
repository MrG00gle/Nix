{ config, pkgs, lib, ... }:{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts {
        
      # This is a typical Nginx configuration for Immich
      "immich.local" = {
        enableACME = false; # Was true.
        forceSSL = false;
        locations."/" = {
          proxyPass = "http://[::1]:${toString config.services.immich.port}";
          proxyWebsockets = true;
          recommendedProxySettings = true;
          extraConfig = ''
            client_max_body_size 50000M;
            proxy_read_timeout   600s;
            proxy_send_timeout   600s;
            send_timeout         600s;
          '';
        };
      };

      "deluge.local" = {
        enableACME = false;
        forceSSL = false;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString services.deluge.web.port}/";     # TODO: Figure out is the last / is nessesery?
          proxyWebsockets = true;  # If Deluge UI uses websockets (it might for some features)
          extraConfig = ''proxy_set_header X-Deluge-Base "/";'';  # Sometimes needed for Deluge web UI to handle base path correctly
        };
      };
    };
  };
}
