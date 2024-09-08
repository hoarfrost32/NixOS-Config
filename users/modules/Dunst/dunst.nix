{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    catppuccin.enable = true;
    catppuccin.flavor = "mocha";
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
