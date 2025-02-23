{
  # Setuping the Locales, input languages, layout switch hotkeys
  
  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.
  
  i18n.extraLocaleSettings = {
    LC_ADDRESS="en_US.UTF-8";
    LC_IDENTIFICATION="en_US.UTF-8";
    LC_MEASUREMENT="en_US.UTF-8";
    LC_MONETARY="en_US.UTF-8";
    LC_NAME="en_US.UTF-8";
    LC_NUMERIC="en_US.UTF-8";
    LC_PAPER="en_US.UTF-8";
    LC_TELEPHONE="en_US.UTF-8";
    LC_TIME="en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "pl,ru";
    variant = "";
    options = "grp:win_space_toggle";
  };
}
