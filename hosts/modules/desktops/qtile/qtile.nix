{ config, lib, pkgs,... }:
let
  
  displaySetup = pkgs.writeShellApplication {
    name = "setup";
    text = ''
      moncnt=$(${pkgs.xorg.xrandr}/bin/xrandr --query | grep -c "connected")

      if [ "$moncnt" -eq 2 ]; then
        ${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --mode 2560x1440 --rate 165 --primary
        ${pkgs.xorg.xrandr}/bin/xrandr --output eDP-1-1 --mode 1920x1080 --right-of DP-2
      else
        ${pkgs.xorg.xrandr}/bin/xrandr --output eDP-1-1 --mode 1920x1080 --primary
      fi
    '';
  };
in
with lib; {
  options = {
    qtile.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Qtile WM";
    };
  };

  config = mkIf config.qtile.enable {
    x11.enable = true;

    services.xserver.windowManager.qtile = {
      enable = true;
      extraPackages = p: with p; [qtile-extras];
    };

    # Enable lightdm.
    services.xserver.displayManager = {
      lightdm = {
        enable = true;
        background = "/etc/lightdm/Wallpapers/scottpilgrim.jpg";
        greeters.slick = {
          enable = true;
        };
        extraSeatDefaults = '' 
          display-setup-script=${displaySetup}/bin/setup
        '';
      };
    };
  };
}
