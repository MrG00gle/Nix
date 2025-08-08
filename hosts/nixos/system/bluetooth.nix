{
  # Enable Bluetooth
  hardware.bluetooth.enable = true;         # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;    # powers up the default Bluetooth controller on boot
  
  # Enbling codecs for wireless headphones
  services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
    "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
    };
  };
}