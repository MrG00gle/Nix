{
  networking.networkmanager.enable = true;
  networking.hostName = "NixBoy"; # Hostname.
  
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      51820 # Wireguard
    ];
    allowedUDPPorts = [ 
      51820 # Wireguard
    ];
  };

  networking.wg-quick.interfaces.home0.configFile = "/home/mrgoogle/WireGuard/home0.conf";

  # Firewall rules for Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

}
