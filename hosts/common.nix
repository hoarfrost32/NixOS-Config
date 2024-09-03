{ config, pkgs, lib, inputs, ... }:
{

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };


  # Set time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_IN";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };

  environment.systemPackages = with pkgs; [
    wget vim ksshaskpass
  ];

  environment.variables = {
    SSH_ASKPASS = lib.mkForce "${pkgs.ksshaskpass}/libexec/ksshaskpass";
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable bluetooth.
    blueman.enable = true;

    # Enable sound with pipewire.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

}
