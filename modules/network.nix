{
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;
  
  networking.hostName = "NixBoy"; # Define your hostname.

  services.openssh.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;         # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;    # powers up the default Bluetooth controller on boot
}
