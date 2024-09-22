{ config, lib, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
  };
}
