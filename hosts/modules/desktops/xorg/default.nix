{
  config,
  lib,
  ...
}:
with lib; {
  options = {
    x11.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable XORG";
    };
  };

  config = mkIf config.x11.enable {
    services.xserver = {
      enable = true;
      xkb = {
        variant = "";
        layout = "us";
      };
    };
  };
}
