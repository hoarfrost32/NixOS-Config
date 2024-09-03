{
  config,
  lib,
  ...
}:
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
      # backend = "x11";
      extraPackages = p: with p; [qtile-extras];
    };

    # Enable lightdm.
    services.xserver.displayManager.lightdm.greeters.slick = {
      enable = true;
#       wayland.enable = false;
    };
  };
}
