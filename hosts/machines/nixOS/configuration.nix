# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Networking.
  networking = {
    hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };

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

  # Enable sound with pipewire.
  hardware = {
    pulseaudio.enable = false;

    # nvidia = {
    #   # Modesetting is required.
    #   modesetting.enable = true;

    #   # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    #   powerManagement = {
    #     enable = false;
    #     # Fine-grained power management. Turns off GPU when not in use.
    #     finegrained = false;
    #   };

    #   prime = {
    #     sync.enable = true;
    #     # Make sure to use the correct Bus ID values for your system!
    #     nvidiaBusId = "PCI:01:0:0";
    #     amdgpuBusId = "PCI:06:0:0";
    #   };

    #   # Use the NVidia open source kernel module (not to be confused with the
    #   # independent third-party "nouveau" open source driver).
    #   # Currently alpha-quality/buggy, so false is currently the recommended setting.
    #   open = false;

    #   # Enable the Nvidia settings menu, accessible via `nvidia-settings`.
    #   nvidiaSettings = true;

    #   # Optionally, you may need to select the appropriate driver version for your specific GPU.
    #   package = config.boot.kernelPackages.nvidiaPackages.stable;
    # };
  };

  security.rtkit.enable = true;

  # specialisation = {
  #   on-the-go.configuration = {
  #     system.nixos.tags = [ "on-the-go" ];
  #     hardware.nvidia = {
  #       prime.offload.enable = lib.mkForce true;
  #       prime.offload.enableOffloadCmd = lib.mkForce true;
  #       prime.sync.enable = lib.mkForce false;
  #     };
  #   };
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hoarfrost = {
    isNormalUser = true;
    description = "hoarfrost";
    extraGroups = [ "networkmanager" "wheel" "tty" "dialout" "video" "audio" "camera" "networkmanager" "lp" "scanner" ];
    shell = pkgs.fish;
  };

  # Fonts
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

  # Install firefox.
  programs = {
    firefox.enable = true;
    fish.enable = true;
  };



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

    # Enable flakes support
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
