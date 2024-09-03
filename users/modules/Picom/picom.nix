{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    activeOpacity = 0.95;
    inactiveOpacity = 0.92;
    vSync = true;
    shadow = true;
    fade = true;
    fadeDelta = 3;
    settings = {
      blur = { 
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
      corner-radius = 8;    
    };
  };
}
