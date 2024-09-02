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
      backend = "x11";
      extraPackages = p: with p; [qtile-extras];
    };

    # Enable sddm.
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = false;
    };
  };
}
