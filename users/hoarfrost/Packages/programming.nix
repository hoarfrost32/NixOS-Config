{ pkgs, ... }:

with pkgs; [
  cmake
  gcc
  go
  hoppscotch
  nodejs_22
  python3
  python312Packages.python-lsp-server
  racket
  tectonic
  texlive.combined.scheme-full
  zed-editor-fhs
  nixd
  nil
  clang-tools
]
