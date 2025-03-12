{ pkgs, lib, ... }:
{

  # Add this overlay to fix the expressvpn package
  # nixpkgs.overlays = [
  #   (self: super: {
  #     expressvpn = super.expressvpn.overrideAttrs (old: {
  #       dontFixup = true;

  #       # Add a postInstall phase to fix the symlink
  #       postInstall = ''
  #         # Remove the broken symlink
  #         rm -f $out/bin/expressvpnd
          
  #         # Copy the actual daemon binary instead of using a symlink
  #         cp $out/opt/expressvpn/expressvpnd $out/bin/expressvpnd
  #       '';

  #     });
  #   })
  # ];

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

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
    LC_ALL = "en_IN";
  };
};

  environment.systemPackages = with pkgs; [
    wget vim dconf
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    # package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable blueman.
    blueman.enable = true;

    # VPN.
    # expressvpn = {
    #   enable = true;
    # };

    # Enable sound with pipewire.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

}
