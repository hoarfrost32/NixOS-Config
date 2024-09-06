{ config, lib, ... }:

with lib;
{
  options = {
    kde = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf (config.kde.enable) {

    services = {
        # Enable the X11 windowing system.
        # You can disable this if you're only using the Wayland session.
        xserver = {
            enable = true;
            # videoDrivers = ["nvidia"];
            # Configure Keymap
            xkb = {
                layout = "us";
                variant = "";
            };
        };

        # Enable the KDE Plasma Desktop Environment.
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;

    };
  };
}
