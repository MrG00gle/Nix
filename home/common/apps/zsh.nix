{ config, lib,... }: {

programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "direnv"
        # "zsh-autosuggestions"
      ];
      theme = "robbyrussell";
    };
    shellAliases = {
      ff = "fastfetch";
      ls = "eza";
      lg = "lazygit";
      pingtest = "ping 8.8.8.8";
      rebuild = "sudo nixos-rebuild switch --flake ~/Nix#NixBoy --no-write-lock-file --log-format internal-json -v |& nom --json && nix-store --gc";
      rebuild-test = "sudo nixos-rebuild test --flake ~/Nix#NixBoy --no-write-lock-file --log-format internal-json -v |& nom --json";
      store-gc = "nix-store --gc";
    };
    history = {
      expireDuplicatesFirst = true;
      save = 1000;
    };
    initContent = ''
      if command -v fastfetch >/dev/null 2>&1; then
        fastfetch
      fi
    '';
  };

#  programs.fish = {
#    enable = lib.mkForce true;
#    shellAliases = {
#      ll = "ls -l";
#      cl = "clear";
#      update = "sudo nixos-rebuild switch &| nom && nix-store --gc" ;
#      upgrade = "sudo nixos-rebuild switch --upgrade &| nom  && nix-store --gc";
#      test = "sudo nixos-rebuild test &| nom && nix-store --gc";
#      test-upgrade = "sudo nixos-rebuild test --upgrade &| nom && nix-store --gc";
#      test-trace = "sudo nixos-rebuild test --show-trace && nix-store --gc";
#      pingtest = "ping 8.8.8.8";
#    };
#  };

}