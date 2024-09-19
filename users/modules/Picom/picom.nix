{ config, lib, ... }:

with lib;
{
  options.picom.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable or Disable Picom Service";
  };

  config = mkIf config.picom.enable {
  services.picom = {
    enable = false;
    backend = "glx";                # Set Backend
    vSync = true;
    activeOpacity = 0.98;           # Opacity Rules
    inactiveOpacity = 0.96;
    opacityRules = [                
      "100:name *?= 'Firefox'"
      "100:name *?= 'mpv'"
      "100:name *?= 'VLC media player'"
    ];    
    shadow = true;                  # Set Shadows
    fade = true;                    # Fade-in/out windows
    fadeDelta = 3;  
    settings = {                    # Extra Settings
      blur = {                      # Blur
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
      settings.vsync-use-glfinish = true;                 # Vsync
      use-damage = false;           # Helps w flickering apparently
      corner-radius = 8;            # Rounded Corners
    };
  };
  };
}
