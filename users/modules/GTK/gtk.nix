{config, pkgs, inputs, ...}: {
  imports = [inputs.catppuccin.homeManagerModules.catppuccin];
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "lavender";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };
}