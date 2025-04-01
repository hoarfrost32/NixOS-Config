final: prev: {
  zed-editor = prev.zed-editor.overrideAttrs (oldAttrs: rec {
    version = "0.179.5";
    src = prev.fetchFromGitHub {
      owner = "zed-industries";
      repo = "zed";
      tag = "v${version}";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    buildInputs = (oldAttrs.buildInputs or []) ++ [ prev.libnotify ];
  });
}