{

  # networking.networkmanager.enable = true;
  networking.wireless.enable = true;
  networking.hostName = "ServerBoy"; # Hostname.

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80  # For Nginx HTTP
      # 8112  # Uncomment if you want direct access to Deluge UI without proxy
    ];
  };


}
