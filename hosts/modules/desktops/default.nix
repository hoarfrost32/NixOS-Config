{ pkgs, ... }:

{
  imports = [
    ./kde/kde.nix
    # Uncomment if you need the Qtile configuration
    # ./qtile/qtile.nix
  ];
}
