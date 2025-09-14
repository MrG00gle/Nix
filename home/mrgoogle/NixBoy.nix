{ config, pkgs, flake-inputs, lib, ... }:
{
  imports = [
    ./home.nix
    ../common/apps/git.nix
    ../common/apps/zsh.nix
    ../common/apps/easyeffects.nix
    ../common/desktop/gnome.nix
  ];

  # Add a new remote. Keep the default one (flathub)
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub-beta";
    location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.packages = [
    { appId = "app.zen_browser.zen"; origin = "flathub";  }
    # { appId = "com.usebottles.bottles"; origin = "flathub";  }
    { appId = "ru.linux_gaming.PortProton"; origin = "flathub";  }
  ];

  home.packages = with pkgs; [

    # Desktop apps
    ungoogled-chromium
    tor-browser
    telegram-desktop
    discord
    teams-for-linux
    caprine
    obsidian
    obs-studio
    audacity
    vlc
    kdePackages.kdenlive
    davinci-resolve
    helvum
    gnome-boxes
    (virt-manager.overrideAttrs (oldAttrs: {
      nativeBuildInputs = oldAttrs.nativeBuildInputs or [] ++ [ makeWrapper ];
      postInstall = oldAttrs.postInstall or "" + ''
        wrapProgram $out/bin/virt-manager \
          --set GDK_BACKEND x11
      '';
    }))
    virtualbox                # Disbled due to "NS_ERROR_FAILURE (0X80004005)" (https://wiki.nixos.org/wiki/VirtualBox). Enabled via virtualiztion.nix
    pdfarranger
    libreoffice-still
    wireshark
    qbittorrent
    gnome-extension-manager
    gnome-console
    solaar
    easyeffects
    parabolic
    dconf-editor

    # Gaming stuff
    bottles
    mission-center
    mangohud
    sidequest
    alvr
    # lenovo-legion
    gamemode

    # Coding stuff
    vscode
    # vscodium
    jetbrains.pycharm-community
    # jetbrains.pycharm-professional
    devenv

    # CLI utils
    lazygit
    eza
    nix-index
    nix-init                  # Command line interactive tool to generate Nix packages from URLs
    unzip
    scrot
    socat
    nmap
    fish
    zsh
    direnv
    zsh-autosuggestions
    zsh-powerlevel10k

    # GNOME extentions
    gnomeExtensions.appindicator
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.dash-to-dock
    gnomeExtensions.auto-move-windows
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.vitals
    gnomeExtensions.search-light
    gnomeExtensions.random-wallpaper

    # Other
    papirus-icon-theme
  ];

}