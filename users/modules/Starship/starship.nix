{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = false;
    settings = {
      time = {
        disabled = false;
        format = "[$time]($style)";
        time_format = "%-I:%M";
        style = "bg:#6D6D6D fg:#14141B";
      };
    };
  };
}
