{pkgs, ...}: {
  
  # Installing selected fonts
  environment.systemPackages = with pkgs; [
    nerd-fonts.symbols-only
  ];

}