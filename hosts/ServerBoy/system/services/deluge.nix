{ config, pkgs, ... }:

{
  # Enable Deluge service with web UI
  services.deluge = {
    enable = true;
    web = {
      enable = true;
      port = 8112;
      # Optionally open firewall for direct access (comment out if only using Nginx proxy)
      # openFirewall = true;
    };
    # Bind Deluge web UI to localhost for security (proxy via Nginx)
    # Note: This requires adding extraArgs, but NixOS module doesn't directly support --interface.
    # Instead, you can override the service or use a custom config file.
    # For simplicity, we'll assume default binding (all interfaces) and rely on firewall.
    # To bind to localhost, you might need to customize via declarativeConfig or overlay.
    declarativeConfig = true;  # Enable to manage config.json via Nix
    config = {
      # Deluge daemon config options
      allow_remote = true;  # If you want thin client access, but for web UI it's separate
    };
    # For web UI binding, it's handled by deluge-web command.
    # To force localhost, use an override:
    systemd.services.delugeweb.serviceConfig.ExecStart = pkgs.lib.mkForce "${pkgs.deluge}/bin/deluge-web --port 8112 --interface 127.0.0.1";
  };

  # Firewall configuration (allow HTTP for Nginx, and optionally Deluge port)
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80  # For Nginx HTTP
      # 8112  # Uncomment if you want direct access to Deluge UI without proxy
    ];
  };

  # Notes:
  # - For 'deluge.local' to resolve on your local network, set up local DNS (e.g., via router or hosts file on clients).
  # - Deluge web UI has its own authentication; set a password via the UI on first access.
  # - If using subpath (e.g., http://yourserver/deluge), adjust locations to "/deluge/" and set Deluge base path accordingly.
  # - Test and adjust as needed; Deluge web might require specific proxy configs for full functionality.
}