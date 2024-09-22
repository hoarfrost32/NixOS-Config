{ ... }:
{
  programs.sioyek = {enable = true;};
  home.file.".config/sioyek/config/prefs_user.config".source = "./config/sioyek.config";
}
