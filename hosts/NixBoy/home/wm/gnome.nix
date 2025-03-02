{ pkgs, lib, ... }: {

  # home-manager.users.mrgoogle = {
    dconf = {
      enable = true;
      settings = {

        "org/gnome/desktop/input-sources" = with lib.gvariant; {
          sources = [(mkTuple [ "xkb" "pl" ]) (mkTuple [ "xkb" "ru" ])];
          xkb-options = ["grp:win_space_toggle" "lv3:ralt_switch"];
        };

        # Desktop settings
          "org/gnome/desktop/media-handling".automount = false;                 # Turning off the automout on incert
          "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";         # Turning off mouse acceleration
          "org/gnome/desktop/peripherals/touchpad".two-finger-scrolling-enabled = true;
          "org/gnome/desktop/session".idle-delay = lib.gvariant.mkUint32 0;     # Time till idle

        "org/gnome/mutter" = {
          edge-tiling = true;
          attach-modal-dialogs = true;
          experimental-features = ["scale-monitor-framebuffer"];
          center-new-windows = true;
          dynamic-workspaces = false;
          workspaces-only-on-primary = false;
        };

          "org/gnome/desktop/interface" = {
            accent-color = "purple";
            color-scheme = "prefer-dark";                                       # Setting Gnome Dark theme
            icon-theme= "Papirus";
            show-battery-percentage = true;                                     # Show battery precentage
            toolkit-accessibility = false;
          };

          "org/gnome/desktop/privacy" = {
            remember-recent-files = true;                                       # Show reccent files
            report-technical-problems = false;                                  # Telemetry
          };

          "org/gnome/desktop/screensaver" = {
            lock-enabled = true;                                                # TODO: dont know what its doing so turn on for now
            color-shading-type = "solid";
            picture-options = "zoom";
          };

          "org/gnome/desktop/wm/preferences" = {
            resize-with-right-button = true;                                    # Turning on window resizing
            button-layout = "appmenu:minimize,maximize,close";
            num-workspaces = lib.gvariant.mkUint16 6;
          };

          "org/gnome/settings-daemon/plugins/power" = {
            # Suspend only on battery power, not while charging.
            idle-dim = false;
            power-button-action = "interactive";
            power-saver-profile-on-low-battery = true;
            sleep-inactive-ac-type = "nothing";
          };

          # Extentions
          "org/gnome/shell" = {
            disable-user-extensions = false;
            enabled-extensions = with pkgs.gnomeExtensions; [ 
              appindicator.extensionUuid
              bluetooth-battery-meter.extensionUuid
              dash-to-dock.extensionUuid
              auto-move-windows.extensionUuid
              clipboard-indicator.extensionUuid
              vitals.extensionUuid
              search-light.extensionUuid
            ];
          };

          # Extension configurations
          "org/gnome/shell/extensions/dash-to-dock" = {
            application-counter-overrides-notifications = true;
            background-color = "rgb(36,36,36)";
            background-opacity = lib.gvariant.mkDouble 0.80000000000000004;
            click-action = "minimize";
            custom-background-color = true;
            custom-theme-shrink = false;
            dash-max-icon-size = lib.gvariant.mkInt16 46;
            dock-position = "BOTTOM";
            extend-height=false;
            height-fraction = lib.gvariant.mkDouble 0.90000000000000002;
            hide-tooltip = false;
            icon-size-fixed = false;
            intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
            middle-click-action = "launch";
            multi-monitor = true;
            preferred-monitor = lib.gvariant.mkInt16 2;
            preferred-monitor-by-connector = "HDMI-1";
            preview-size-scale = lib.gvariant.mkDouble 0.0;
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
          };

          "org/gnome/shell/extensions/search-light" = {
            background-color = "rgb(36,36,36)";
            blur-background = false;
            blur-brightness = lib.gvariant.mkDouble 0.59999999999999998;
            blur-sigma = lib.gvariant.mkDouble 30.0;
            border-radius = lib.gvariant.mkDouble 2.40625;
            currency-converter = true;
            entry-font-size = lib.gvariant.mkInt16 0;
            monitor-count = lib.gvariant.mkInt16 2;
            preferred-monitor = lib.gvariant.mkInt16 0;
            scale-height = lib.gvariant.mkDouble 0.10000000000000001;
            scale-width = lib.gvariant.mkDouble 0.10000000000000001;
            shortcut-search = ["<Alt>space"];
            show-panel-icon = false;
            text-color = "rgba(224, 224, 224, 0.95)";
            unit-converter = true;
          };

          "org/gnome/shell/extensions/vitals" = {
            hot-sensors=["_system_load_1m_" "_processor_usage_" "_memory_usage_" "_temperature_amdgpu_edge_"];
            position-in-panel = lib.gvariant.mkInt16 0;
            show-fan = false;
            show-gpu = false;
            show-system = false;
            show-voltage = false;
            update-time = lib.gvariant.mkInt16 1;
          };

          "org/gnome/shell/keybindings" = {
            toggle-quick-settings = lib.gvariant.mkEmptyArray "s";
          };

          # Keybindings
          "org/gnome/desktop/wm/keybindings" = {
            activate-window-menu = lib.gvariant.mkEmptyArray "s";
            view-split-on-left = lib.gvariant.mkEmptyArray "s";
            view-split-on-right = lib.gvariant.mkEmptyArray "s";
            switch-to-workspace-left = ["<Super>Left"];
            switch-to-workspace-right= ["<Super>Right"];
            switch-input-source = ["<Super>space"];
          };

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Control><Alt>t";
            command = "gnome-terminal";
            name = "Terminal";
          };

          "org/gnome/settings-daemon/plugins/media-keys" = {
            activate-window-menu = lib.gvariant.mkEmptyArray "s";
            screenreader = lib.gvariant.mkEmptyArray "s";
            magnifier = lib.gvariant.mkEmptyArray "s";
            help = lib.gvariant.mkEmptyArray "s";
            home = ["<Super>e"];
            calculator = ["<Super>c"];
            control-center = ["<Super>s"];
            www = ["<Super>F1"];
            custom-keybindings = [
              # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            ];
          };

      };
    };
  # };

}