self: super: {
  protonvpn-gui = super.protonvpn-gui.overrideAttrs (oldAttrs: rec {
    version = "4.9.4";  # New version you want to use
    src = super.fetchFromGitHub {
      owner = "ProtonVPN";
      repo = "proton-vpn-gtk-app";
      tag = "v${version}";
      hash = "0000000000000000000000000000000000000000000000000000";  # Update the hash for the new source
    };
  });
}
