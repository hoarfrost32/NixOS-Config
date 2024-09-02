{ pkgs, ... }:

{
  imports = [
    ./kde/kde.nix
    ./qtile/qtile.nix
  ];
}
