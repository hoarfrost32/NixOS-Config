{ inputs, system }:

final: prev: {
  zed-editor = inputs.zed-editor.packages.${system}.default.overrideAttrs (oldAttrs: {
    cargoExtraArgs = "-p zed -p cli --features=gpui/runtime_shaders"; # Remove --locked flag
  });
}