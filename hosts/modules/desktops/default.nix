{ myScripts, ... }:

{
  imports = [
    ./kde/kde.nix
    ./qtile/qtile.nix {inherit myScripts;}
    ./xorg/default.nix
  ];
}
