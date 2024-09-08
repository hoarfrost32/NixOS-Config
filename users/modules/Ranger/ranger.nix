{ ... }:

{
  programs.ranger = {
    enable = true;
    plugins.ranger-devicons.source = builtins.fetchGit {
      url = "https://github.com/alexanderjeurissen/ranger_devicons";
    };
  };
}
