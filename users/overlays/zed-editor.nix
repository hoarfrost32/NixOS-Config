final: prev: {
  zed-editor-fhs = prev.zed-editor-fhs.overrideAttrs (oldAttrs: rec {
    version = "0.180.2";
    src = prev.fetchFromGitHub {
      owner = "zed-industries";
      repo = "zed";
      tag = "v${version}";
      sha256 = "sha256-4FwQxg3UUE0vFLsy+88Naal+YTCGfNMOtNhnG+W2HiU=";
    };
    buildInputs = (oldAttrs.buildInputs or []) ++ [ prev.libnotify ];
    
  });
}