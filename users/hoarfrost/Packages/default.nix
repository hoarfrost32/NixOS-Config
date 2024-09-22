{ pkgs }:


(./programming.nix {inherit pkgs;}) ++
(./tui.nix {inherit pkgs;}) ++
(./applications.nix {inherit pkgs;}) ++
(./cli-utilities.nix {inherit pkgs;})
