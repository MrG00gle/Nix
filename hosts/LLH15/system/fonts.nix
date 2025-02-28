{pkgs, ...}: {

  # Installing selected fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

}