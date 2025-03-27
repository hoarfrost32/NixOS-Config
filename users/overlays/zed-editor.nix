final: prev: {
  zed-editor = prev.zed-editor.overrideAttrs (oldAttrs: rec {
    version = "0.180.0-pre";
    src = prev.fetchFromGitHub {
      owner = "zed-industries";
      repo = "zed";
      tag = "v${version}";
      sha256 = "sha256-RSINcf3pDNyvBBlFOTvrITUk8SxPqn7foq2qUSrZQD0=";
    };
    
    # cargoHash = "";
    
    patches = [ ./patches/generate-licenses.patch ];
    
    postPatch = ''
      substituteInPlace $cargoDepsCopy/webrtc-sys-*/build.rs \
        --replace-fail "cargo:rustc-link-lib=static=webrtc" "cargo:rustc-link-lib=dylib=webrtc"
    '';
    
    # buildInputs = (oldAttrs.buildInputs or []) ++ [ prev.libnotify ];
  });
}