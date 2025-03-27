final: prev: {
  protonvpn-gui = prev.protonvpn-gui.overrideAttrs (oldAttrs: rec {
    version = "4.9.4";
    src = prev.fetchFromGitHub {
      owner = "ProtonVPN";
      repo = "proton-vpn-gtk-app";
      tag = "v${version}";
      sha256 = "sha256-r0mcIGmBuGp3wDuHIZrb9tQ/vZ74DvAfLMuJFJNlyfY=";
    };
    buildInputs = (oldAttrs.buildInputs or []) ++ [ prev.libnotify ];
  });
}