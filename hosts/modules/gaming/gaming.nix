{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    gaming = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf (config.gaming.enable) {

    # Hardware stuff
    hardware.graphics = {
      driSupport = true;
      driSupport32Bit = true;

      extraPackages = [pkgs.amdvlk];
      extraPackages32 = [pkgs.driversi686Linux.amdvlk];
    };

    # Enable Gamemode
    programs.gamemode = {
      enable = true;
      settings = {
        general.inhibit_screensaver = 0;
      };
    };

    # Steam

      # Apparently need to provide java in case there is a missing dependency
    programs.java.enable = true;

      # Now on to steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      package = pkgs.steam.override {
        withPrimus = true;
        withJava = true;
        extraPkgs = pkgs: [bumblebee glxinfo];
      };
    };

    # Lutris, Wine

    environment.systemPackages = with pkgs; [
      lutris
      wineWowPackages.stable
      winetricks
    ];

  };
}
