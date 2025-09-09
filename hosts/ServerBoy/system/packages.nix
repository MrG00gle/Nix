{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    git
    file
    tree
    nano
    nix-output-monitor
    docker
    python310
  ];
}
