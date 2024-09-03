{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = 'glx';
    activeOpacity = 0.95;
    inactiveOpacity = 0.9;
    vSync = true;
    settings = {
      blur = { 
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };      
    };
  };
}
