{
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "dayly";
    options = "--delete-older-than 3d";
  };
}
