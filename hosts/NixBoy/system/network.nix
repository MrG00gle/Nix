{

  networking.networkmanager.enable = true;
  # networking.wireless = {
  #   enable = true;
  #   userControlled.enable = true;
  # };

  networking.hostName = "NixBoy"; # Hostname.
  
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80  # For Nginx HTTP
      443
      51820
    ];
    allowedUDPPorts = [ 
      51820 # Wireguard
      443
    ];
  };

  # Firewall rules for Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

}
