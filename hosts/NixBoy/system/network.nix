{ pkgs, ... }: {
  
  networking = {
    hostName = "NixBoy";

    networkmanager = {
      enable = true;
      plugins = with pkgs; [ 
        networkmanager-openvpn
        networkmanager-sstp
      ];
    };
    
  # ================================== Wireguard config ==========================================
    
    # wg-quick.interfaces.home0.configFile = "/home/mrgoogle/WireGuard/home0.conf";

  # ==============================================================================================
    
    firewall = {
      enable = true;
      allowedTCPPorts = [
        51820 # Wireguard
        3389 # RDP
        3390 # RDP
        443
      ];
      allowedUDPPorts = [ 
        51820 # Wireguard
        3389 # RDP
        3390 # RDP
        443
      ];
    };
  };

  # Firewall rules for Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

}
