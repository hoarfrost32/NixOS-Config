{ pkgs }:


(import ./programming.nix {inherit pkgs;}) ++
(import ./tui.nix {inherit pkgs;}) ++
(import ./applications.nix {inherit pkgs;}) ++
(import ./cli-utilities.nix {inherit pkgs;})
