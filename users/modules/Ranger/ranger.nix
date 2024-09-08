{ ... }:

let
  scopeConf = ./config/scope.sh;
in
{
  programs.ranger = {
    enable = true;
    plugins = [
      {
        # File Icons in ranger
        name = "ranger_devicons";
        src = builtins.fetchGit {
          url = "https://github.com/alexanderjeurissen/ranger_devicons";
        };
      }
    ];
    extraConfig = ''
      default_linemode devicons
      set preview_images true
      set preview_images_method ueberzug
      map <C-c> shell dragon -a -x %p --and-exit
    '';
  };
  
  # Create a symlink for `rifle.conf` in the ranger config directory
  home.file.".config/ranger/scope.sh".source = scopeConf;
}
