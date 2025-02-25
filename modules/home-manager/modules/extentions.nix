{ pkgs, ... }: {
  home-manager.users.mrgoogle = {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [ 
        gsconnect.extensionUuid
        appindicator.extensionUuid
        bluetooth-battery-meter.extensionUuid
        dash-to-dock.extensionUuid
        auto-move-windows.extensionUuid
        clipboard-indicator.extensionUuid
        vitals.extensionUuid
        search-light.extensionUuid
      ];
    };
  };
};
}
