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
  home.packages =
    (import ./Packages {inherit pkgs;}) ++
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

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        github.copilot
        github.copilot-chat
        catppuccin.catppuccin-vsc-icons
        catppuccin.catppuccin-vsc
      ];
    };

    bat.enable = true;
    btop.enable = true;
    mpv.enable = true;
    rofi.enable = true;
    tmux.enable = true;
  
  };
  
  gtk.enable = true;

  catppuccin = {
    flavor = "mocha";
    enable = true;
    accent = "lavender";
    cursors = {
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
