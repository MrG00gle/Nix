{ lib, ... }: {
  imports =
    [
      ./samba.nix
      ./nginx.nix
      ./adguard.nix
      ./immich.nix
      ./deluge.nix
      ./forgejo.nix
      # ./forgejo-action-runner.nix
    ];
  
  services.openssh.enable = true; # Enabling SSH
}