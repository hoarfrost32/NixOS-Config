{ config, lib, ... }:

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
    services.xserver.displayManager.lightdm = {
      enable = true;
      background = "/etc/lightdm/Wallpapers/scottpilgrim.jpg";
      greeters.slick = {
        enable = true;
      };
    };
  };
}
