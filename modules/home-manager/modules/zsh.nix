{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      upgrade = "sudo nixos-rebuild switch --upgrade";
      test = "sudo nixos-rebuild test";
      pingtest = "ping 8.8.8.8";
    };

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "history" "zsh-autosuggestions" "zsh-syntax-highlighting" "docker" "sudo"];
      theme = "powerlevel10k/powerlevel10k";
    };
};

}