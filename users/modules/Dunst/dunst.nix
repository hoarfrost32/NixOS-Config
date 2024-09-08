{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    catppuccin.enable = true;
    catppucin.flavor = "mocha";
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
