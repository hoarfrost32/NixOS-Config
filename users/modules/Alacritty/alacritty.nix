{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "Jetbrains Mono";
        size = 13;
      };
      window = {
        opacity = 0.6;
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };
}
