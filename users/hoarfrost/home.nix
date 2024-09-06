{ pkgs, ... }:

{
  home.username = "hoarfrost";
  home.homeDirectory = "/home/hoarfrost";

  # Import all needed modules.
  imports = [
    ../modules/Alacritty/alacritty.nix
    ../modules/Picom/picom.nix
    ../modules/GTK/gtk.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Packages I want installed.
  home.packages = with pkgs; [
    hello
    sublime
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
    nitrogen
    xfce.thunar
    telegram-desktop
    alsa-utils
    playerctl
    flameshot
    networkmanagerapplet
    dunst
    thunderbird
    ranger
    tmux
    dmenu
    zip
    unzip
    lapce
    nil
    x11_ssh_askpass
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
  
  catppuccin = {
    flavor = "mocha";
    enable = true;
    accent = "lavender";
    pointerCursor = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
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
