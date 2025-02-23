{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      upgrade = "sudo nixos-rebuild switch --upgrade";
      test = "sudo nixos-rebuild test";
      pingtest = "ping 8.8.8.8";
    };

    histSize = 10000;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo"];
      theme = "agnoster";
    };
};

}