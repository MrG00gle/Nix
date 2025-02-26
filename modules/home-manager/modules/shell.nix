{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;

    shellAliases = {
      ll = "ls -l";
      cl = "clear";
      update = "sudo nixos-rebuild switch |& nom";
      upgrade = "sudo nixos-rebuild switch --upgrade |& nom";
      test = "sudo nixos-rebuild test |& nom";
      test-upgrade = "sudo nixos-rebuild test --upgrade |& nom";
      test-trace = "sudo nixos-rebuild test --show-trace";
      pingtest = "ping 8.8.8.8";
    };

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "history" "zsh-autosuggestions" "zsh-syntax-highlighting" "docker" "sudo"];
      theme = "powerlevel10k/powerlevel10k";
    };
};

  programs.fish = {
    histSize = 10000;
    shellAliases = {
      ll = "ls -l";
      cl = "clear";
      update = "sudo nixos-rebuild switch &| nom";
      upgrade = "sudo nixos-rebuild switch --upgrade &| nom";
      test = "sudo nixos-rebuild test &| nom";
      test-upgrade = "sudo nixos-rebuild test --upgrade &| nom";;
      test-trace = "sudo nixos-rebuild test --show-trace";
      pingtest = "ping 8.8.8.8";
    };
  };

}