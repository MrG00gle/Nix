{ pkgs, ... }: {
  home-manager.users.mrgoogle = {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
	gsconnect.extensionUuid
      ];
    };
  };
};
}
