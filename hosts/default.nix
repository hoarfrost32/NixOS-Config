{ system, ... }:

{

  imports =[
      ./common.nix
      ./machines/${system}/configuration.nix
    ];
}
