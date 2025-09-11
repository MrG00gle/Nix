{ config, lib, pkgs, ... }:{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts = {
      "deluge.local" = {
        enableACME = false;
        forceSSL = false;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString services.deluge.web.port}/";
          recommendedProxySettings = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };

      "adguard.local" = {
        enableACME = false;
        forceSSL = false;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString services.adguardhome.port}/";
          recommendedProxySettings = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };

      "audiobookshelf.local" = {
        enableACME = false;
        forceSSL = false;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString services.audiobookshelf.port}/";
          recommendedProxySettings = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };

      "immich.local" = {
        enableACME = false;
        forceSSL = false;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.immich.port}/";
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

    };

  };
}