{ ... }:

{
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      font = {
        normal.family = "Jetbrains Mono";
        size = 13;
      };
      window = {
        opacity = 0.9;
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };
}
