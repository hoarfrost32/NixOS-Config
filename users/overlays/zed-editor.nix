final: prev: {
  zed-editor = prev.zed-editor.overrideAttrs (oldAttrs: rec {
    version = "nightly";
    src = prev.fetchFromGitHub {
      owner = "zed-industries";
      repo = "zed";
      tag = "${version}";
      sha256 = "sha256-r0mcIGmBuGp3wDuHIZrb9tQ/vZ74DvAfLMuJFJNlyfY=";
    };
    # buildInputs = (oldAttrs.buildInputs or []) ++ [ prev.libnotify ];
  });
}