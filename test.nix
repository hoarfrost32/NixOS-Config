{ pkgs ? import <nixpkgs> {} }:

let
  version = "nightly";
  src = pkgs.fetchFromGitHub {
    owner = "zed-industries";
    repo = "zed";
    rev = version;
    sha256 = "sha256-lyxWze+CBsgIZWmR2/FDmr4MJiNDTKeJsRdZ82RXtXk=";  # This will fail with correct hash
  };

  zed = pkgs.zed-editor.overrideAttrs (drv: {
    inherit version;
    inherit src;
    cargoDeps = drv.cargoDeps.overrideAttrs (_: {
      name = "zed-${version}-vendor";
      inherit src;
      outputHash = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";  # This will fail with correct hash
    });
  });
in zed
