final: prev: {
  zed-editor = prev.zed-editor.overrideAttrs (oldAttrs: rec {
    version = "0.178.5";
    
    src = prev.fetchFromGitHub {
      owner = "zed-industries";
      repo = "zed";
      tag = "v${version}";
      sha256 = "sha256-YkoIOBoR5hMt99D1bJ1yWLv7C/rY6VKC5J/7c5SMUFs=";
    };   
    
    cargoHash = "sha256-xJaiHngsm74RdcEUXaDrc/Hwy4ywZrEiJt7JYTc/NpM=";
    
    # patches = [];
  });
}