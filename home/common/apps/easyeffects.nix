{lib, ...}: {

#  programs.dconf.enable = true;
  services.easyeffects.extraPresets = {
    tonor-tc20 = {
        input = {
          blocklist = [];
          plugins_order = [
            "rnnoise#0"
            "gate#0"
            "stereo_tools#0"
            "reverb#0"
          ];
          "gate#0" = {
            attack = 5.0;
            bypass = false;
            curve-threshold = -55.0;
            curve-zone = -6.0;
            dry = -100.0;
            hpf-frequency = 10.0;
            hpf-mode = "off";
            hysteresis = false;
            hysteresis-threshold = -12.0;
            hysteresis-zone = -6.0;
            input-gain = 0.0;
            lpf-frequency = 20000.0;
            lpf-mode = "off";
            makeup = 0.0;
            output-gain = 0.0;
            reduction = -24.0;
            release = 200.0;
            sidechain = {
              input = "Internal";
              lookahead = 0.0;
              mode = "RMS";
              preamp = 0.0;
              reactivity = 10.0;
              source = "Middle";
              stereo-split-source = "Left/Right";
            };
            stereo-split = false;
            wet = 0.0;
          };
          "reverb#0" = {
            amount = -12.0;
            bass-cut = 300.0;
            bypass = true;
            decay-time = 1.5;
            diffusion = 0.5;
            dry = 0.0;
            hf-damp = 5000.0;
            input-gain = 0.0;
            output-gain = 0.0;
            predelay = 0.0;
            room-size = "Large";
            treble-cut = 5000.0;
          };
          "rnnoise#0" = {
            bypass = false;
            enable-vad = false;
            input-gain = 0.0;
            model-name = "";
            output-gain = 0.0;
            release = 20.0;
            vad-thres = 50.0;
            wet = 0.0;
          };
          "stereo_tools#0" = {
            balance-in = 0.0;
            balance-out = 0.0;
            bypass = false;
            delay = 0.0;
            input-gain = 0.0;
            middle-level = 0.0;
            middle-panorama = 0.0;
            mode = "LR > LL (Mono Left Channel)";
            mutel = false;
            muter = false;
            output-gain = 0.0;
            phasel = false;
            phaser = false;
            sc-level = 1.0;
            side-balance = 0.0;
            side-level = 0.0;
            softclip = false;
            stereo-base = 0.0;
            stereo-phase = 0.0;
          };
        };
    };
  };

  services.easyeffects.preset = "tonor-tc20";

}