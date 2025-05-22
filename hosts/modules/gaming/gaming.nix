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
      enable = true;
      enable32Bit = true;

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

    # Now on to steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };

    # MangoHud and Bottles

    environment.systemPackages = with pkgs; [
      mangohud
      bottles
     ];
  #   [(lutris.override {
  #     extraLibraries = pkgs: [
  #       libvdpau
  #       libgudev

  #       gst_all_1.gstreamer
  #       gst_all_1.gst-plugins-ugly
  #       gst_all_1.gst-plugins-base
  #       gst_all_1.gst-plugins-good
  #       gst_all_1.gst-plugins-bad
  #       pango
  #       json-glib
  #       libdrm
  #       libxkbcommon
  #       libxcrypt
  #       libusb1

  #       #screencap dependencies
  #       gtk3
  #       zlib
  #       atk
  #       cairo
  #       freetype
  #       gdk-pixbuf
  #       fontconfig


  #     ];
  #     extraPkgs = pkgs: [
  #       speex
  #     ];
  #   })];

  };
}
