{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "Jetbrains Mono";
        size = 13;
      };
    };

    home.file = {
      ".config/alacritty/alacritty.toml".source = ./alacritty.toml;
    };
  };
}
