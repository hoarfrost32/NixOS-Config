{ pkgs, ... }:

{
  home.username = "hoarfrost";
  home.homeDirectory = "/home/hoarfrost";

  # Import all needed modules.
  imports = (import ../modules);

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
    thunderbird
    tmux
    dmenu
    zip
    unzip
    lapce
    nil
    x11_ssh_askpass
    gnome-keyring
    killall
    nodejs_22
    python312Packages.python-lsp-server
    qbittorrent
    cowsay
    fortune
    sl 
    mpv
    vlc
    lsd
    btop
    ueberzugpp
    mediainfo
    xdragon
    mdcat
    highlight
    poppler_utils
    zed-editor
    ripgrep
    coreutils
    fd
    pandoc
    shellcheck
    zapzap
    whatsapp-for-linux
    ollama
    cmake
    gcc
    copyq
  ] ++
  [(pkgs.discord.override {
    withVencord = true;
  })];

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
    
    direnv = {
      enable = true;
      nix-direnv.enable = true;
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
    EDITOR = "emacs";
    SHELL = "fish";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
