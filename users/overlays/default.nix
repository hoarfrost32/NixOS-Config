{ zeditor-input }:

final: prev:
  let
    zedEditorOverlay = import ./zed-editor.nix final prev zeditor-input;
    tyOverlay = import ./ty.nix final prev zeditor-input;
    llamaOverlay = import ./llama-cpp.nix final prev; 
  in zedEditorOverlay // tyOverlay // llamaOverlay
