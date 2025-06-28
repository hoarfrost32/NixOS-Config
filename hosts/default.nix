{ system, myScripts, ... }:

  let
    common = import ./common.nix;
    machine_config = import ./machines/${system}/configuration.nix { inherit myScripts; };
  in common // machine_config
