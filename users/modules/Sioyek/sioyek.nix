{ ... }:
let
  sioyekConf = ./config/sioyek.config;
in
{
  programs.sioyek = {enable = true;};
  home.file.".config/sioyek/prefs_user.config".source = sioyekConf;
}
