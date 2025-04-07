{zed-editor-input ? null}:

final: prev:
  (import ./proton-vpn.nix final prev) //
  (import ./zed-editor.nix {inherit final prev; inherit zed-editor-input;})