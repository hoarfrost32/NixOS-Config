{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: with epkgs; [
      nerd-icons
      vterm
    ];
  };
}
