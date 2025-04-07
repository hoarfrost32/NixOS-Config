final: prev: {
  zed-editor = prev.zed-editor.overrideAttrs (oldAttrs: rec {
    version = "0.180.2";
    src = prev.fetchFromGitHub {
      owner = "zed-industries";
      repo = "zed";
      tag = "v${version}";
      sha256 = "sha256-4FwQxg3UUE0vFLsy+88Naal+YTCGfNMOtNhnG+W2HiU=";
    };
    cargoDeps = prev.rustPlatform.fetchCargoVendor {
      inherit src;
      name = "zed-editor-vendor.tar.gz";
      hash = "sha256-5Y4GH4AP4Ry73w2cUllVTLP3RulJ0cE8B+S//QpjdFc=";
    };
  });
}