{
  nix.settings.auto-optimise-store = true; # Turning on periodic store cleaning
  
  # Defining period of store cleaning
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };
}
