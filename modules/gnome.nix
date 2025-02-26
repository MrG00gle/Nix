{ pkgs, lib, ... }: {
  
  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    gnome-music
    gnome-photos
    epiphany # gnome browser
    gnome-tour
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ]);
  
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.dconf.profiles = {
    # TODO: Investigate dconf.profiles (https://github.com/Electrostasy/dots/blob/c62895040a8474bba8c4d48828665cfc1791c711/profiles/system/gnome/default.nix#L123-L287)
    mrgoogle.databases = [{
      settings = with lib; {
        # Desktop settings
        "org/gnome/desktop/media-handling".automount = false;                 # Turning off the automout on incert
        "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";         # Turning off mouse acceleration
        "org/gnome/desktop/peripherals/touchpad".two-finger-scrolling-enabled = true;
        "org/gnome/desktop/session".idle-delay = mkUint32 0;                  # Time till idle
        "org/gnome/desktop/privacy".remember-recent-files = true;             # Show reccent files
        "org/gnome/desktop/privacy".report-technical-problems = false;        # Telemetry

        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";                                       # Setting Gnome Dark theme
          show-battery-percentage = true;                                     # Show battery precentage
        }

        # "org/gnome/desktop/privacy" = {
        #   remember-recent-files = true;                                       # Show reccent files
        #   report-technical-problems = false;                                  # Telemetry
        # }

        "org/gnome/desktop/screensaver" = {
          lock-enabled = true;                                                # TODO: dont know what its doing so turn on for now
          color-shading-type = "solid";
          picture-options = "zoom";
        }

        "org/gnome/desktop/wm/preferences" = {
          resize-with-right-button = true;                                    # Turning on window resizing
          button-layout = "appmenu:minimize,maximize,close";
        }

        "org/gnome/settings-daemon/plugins/power" = {
          # Suspend only on battery power, not while charging.
          sleep-inactive-ac-type = "nothing";
          power-button-action = "interactive";
        };

        # Extensions
        "/org/gnome/shell/extensions/dash-to-dock" = {
          application-counter-overrides-notifications=true;
          background-color = "rgb(36,36,36)";
          background-opacity = 0.80000000000000004;
          click-action = "minimize";
          custom-background-color = true;
          custom-theme-shrink = false;
          dash-max-icon-size = 46;
          dock-position = "BOTTOM";
          extend-height=false;
          height-fraction = 0.90000000000000002;
          hide-tooltip = false;
          icon-size-fixed = false;
          intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
          middle-click-action = "launch";
          multi-monitor = true;
          preferred-monitor = -2;
          preferred-monitor-by-connector = "HDMI-1";
          preview-size-scale = 0.0;
          scroll-action = "cycle-windows";
          scroll-to-focused-application = true;
          shift-click-action = "minimize";
          shift-middle-click-action = "launch";
          show-apps-always-in-the-edge = true;
          show-favorites = true;
          show-icons-emblems = true;
          show-icons-notifications-counter = false;
          show-mounts = false;
          transparency-mode = "FIXED";
        }

        /org/gnome/shell/extensions/search-light = {
          background-color = (0.14117647707462311, 0.14117647707462311, 0.14117647707462311, 1.0);
          blur-background = false;
          blur-brightness = 0.59999999999999998;
          blur-sigma = 30.0;
          border-radius = 2.40625;
          currency-converter = true;
          entry-font-size = 0;
          monitor-count = 2;
          preferred-monitor = 0;
          scale-height = 0.10000000000000001;
          scale-width = 0.10000000000000001;
          shortcut-search = ["<Alt>space"];
          show-panel-icon = false;
          text-color = (1.0, 1.0, 1.0, 1.0);
          unit-converter = true;
        }

        # Keybindings
        "org/gnome/desktop/wm/keybindings" = {
          switch-to-workspace-left = ["<Super>Left"];
          switch-to-workspace-right= ["<Super>Right"];
          switch-input-source = ["<Super>space"];                         # TODO: Test the setting <Space> or <SpaceBar>
        }

        "org/gnome/settings-daemon/plugins/media-keys" = {
          screenreader = mkEmptyArray type.string;
          magnifier = mkEmptyArray type.string;
          calculator = [ "<Super>c" ];
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          binding = "<Super>e";
          command = "/usr/bin/env nautilus";
          name = "File Manager";
        };
        
        # "org/gnome/mutter" = {
        #   edge-tiling = true;
        #   attach-modal-dialogs = true;
        #   experimental-features = [ "scale-monitor-framebuffer" ];
        # };
      }
    }]
  }

}
