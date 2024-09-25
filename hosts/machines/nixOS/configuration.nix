# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/desktops/default.nix
      ../../modules/gaming/gaming.nix
    ];

  # Networking.
  networking = {
    hostName = "nixos"; # Define your hostname.
    # Enable networking
    networkmanager.enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
  services.expressvpn.enable = true;

  # Enable sound with pipewire.
  hardware = {
    pulseaudio.enable = false;
    pulseaudio.support32Bit = true;

    bluetooth.enable = true;

    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      powerManagement = {
        enable = false;
        # Fine-grained power management. Turns off GPU when not in use.
        finegrained = false;
      };

      prime = {
        sync.enable = true;
        # Make sure to use the correct Bus ID values for your system!
        nvidiaBusId = "PCI:01:0:0";
        amdgpuBusId = "PCI:06:0:0";
      };

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu, accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  # Enable qtile. K̶i̶n̶d̶a̶ f̶u̶c̶k̶y̶ r̶n̶, f̶i̶x̶i̶n̶g̶ i̶t̶. u̶s̶e̶ k̶d̶e̶ m̶e̶a̶n̶wh̶i̶l̶e̶. fixed!
  # kde.enable = true;
  qtile.enable = true;

  # Enable the gaming related options.
  gaming.enable = true;

  security.rtkit.enable = true;

  specialisation = {
    on-the-go.configuration = {
      system.nixos.tags = [ "on-the-go" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce true;
        prime.offload.enableOffloadCmd = lib.mkForce true;
        prime.sync.enable = lib.mkForce false;
      };
    };
  };

  # User accounts
  users.users.hoarfrost = {
    isNormalUser = true;
    description = "hoarfrost";
    extraGroups = [ "networkmanager" "wheel" "tty" "dialout" "video" "audio" "camera" "networkmanager" "lp" "scanner" "gamemode"];
    shell = pkgs.fish;
  };

  fonts.packages = with pkgs; [
    carlito # NixOS
    vegur # NixOS
    source-code-pro
    jetbrains-mono
    font-awesome # Icons
    corefonts # MS
    noto-fonts # Google + Unicode
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];

  # Install firefox and fish
  programs = {
    firefox.enable = true;
    fish.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes support
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };
  
  # Install expressvpn. 
  environment.systemPackages = with pkgs; [
    expressvpn
  ];

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
