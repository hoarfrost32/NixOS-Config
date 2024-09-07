{ ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";                # Set Backend
    vSync = true;
    activeOpacity = 0.95;           # Opacity Rules
    inactiveOpacity = 0.92;
    opacityRules = [                
      "100:name *?= 'Firefox'"
      "100:name *?= 'mpv'"
      "100:name *?= 'VLC'"
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
      use-damage = false;           # Helps w tearing apparently
      corner-radius = 8;            # Rounded Corners
    };
  };
}
