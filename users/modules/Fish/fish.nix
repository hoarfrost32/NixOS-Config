{ ... }:

{
  programs.fish = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
    shellAliases = {

      # git aliases
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gdiff = "git diff";
      gl = "git prettylog";
      gp = "git push";
      gs = "git status";
      gt = "git tag";

      # navigational aliases
      cdt = "cd ..";
      cdtt = "cd ../..";
      ls = "lsd";
      mkdir = "mkdir -pv";
      
      #Fish stuff
      activate = "source .venv/bin/activate.fish";
      refresh = "xrandr --output DP-2 --mode 2560x1440 --refresh";
      position = "xrandr --output eDP-1-1 --mode 1920x1080 --pos 2560x180";
      cowsay = "kittysay";
      
      #direnv
      usenix = ''echo "use nix" >> .envrc && direnv allow'';
      
      # nix aliases
      rebuild = "sudo nixos-rebuild switch --flake .#nixOS --impure";
      nixgc="sudo nix-collect-garbage -d";        
      nixpkgs="nix-env -qaP '*' | grep";
      nixinfo="nix-shell -p nix-info --run 'nix-info -m'";
      nix-shell = "nix-shell --run fish";
      envpkgs = "nix-env -q";
    };
    
    shellInit = ''
      fortune | kittysay
    '';
  };
}
