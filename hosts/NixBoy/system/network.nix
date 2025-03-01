{

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;
  networking.hostName = "NixBoy"; # Hostname.

  # Creating firewall rules for steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

}
