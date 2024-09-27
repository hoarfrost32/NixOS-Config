{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      time = {
        disabled = false;
        format = "[$time]($style)";
        time_format = "%-I:%M:%S %p";
        style = "bg:#6D6D6D fg:#14141B";
      };
    };
  };
}
