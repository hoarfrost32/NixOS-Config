final: prev: {
  protonvpn-gui = prev.protonvpn-gui.overrideAttrs (oldAttrs: rec {
    version = "4.9.5";
    src = prev.fetchFromGitHub {
      owner = "ProtonVPN";
      repo = "proton-vpn-gtk-app";
      tag = "v${version}";
      sha256 = "sha256-mXRTXr7u049pgPRK5gwaGfQUmUl4vlKca4lRH06HZj8=";
    };
    buildInputs = (oldAttrs.buildInputs or []) ++ [ prev.libnotify ];
  });
}