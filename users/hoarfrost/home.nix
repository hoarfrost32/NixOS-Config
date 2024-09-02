{ config, pkgs, ... }:

{
  home.username = "hoarfrost";
  home.homeDirectory = "/home/hoarfrost";

  # Import all needed modules.
  imports = [
    ../modules/Alacritty/alacritty.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Packages I want installed.
  home.packages = with pkgs; [
    hello
    kdePackages.kate
    zed-editor
    git
    python3
    hyperion-ng
    racket
    sioyek
    expressvpn
    neofetch
    ntfs3g
    hoppscotch
  ];

  programs = {
    git = {
      enable = true;
      userName = "hoarfrost32";
      userEmail = "aditya.tejpaul@research.iiit.ac.in";
      extraConfig = {
        credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      };
    };
  };

  # Manage environment variables. These will be explicitly sourced when using a
  # shell provided by Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
