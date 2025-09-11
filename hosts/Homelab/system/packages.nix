{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    git
    file
    tree
    nano
    nix-output-monitor
    ncdu
    docker
    python310
  ];
}
