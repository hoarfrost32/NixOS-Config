{ pkgs, inputs, system }:


(import ./programming.nix {inherit pkgs; inherit inputs; inherit system;}) ++
(import ./applications.nix {inherit pkgs; inherit inputs; inherit system;}) ++
(import ./cli-utilities.nix {inherit pkgs; inherit inputs; inherit system;})
