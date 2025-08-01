{
  description = "hoarfrost's NixOS config.";

  inputs = {
    
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    zed-editor-input.url = "github:nixos/nixpkgs/master";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    # zed-editor.url = "github:zed-industries/zed";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };
  
  outputs = { self, nixpkgs, zen-browser, home-manager, nixos-hardware, catppuccin, zed-editor-input, ... } @ inputs:
  let
    myScripts = {
      display-setup = pkgs: pkgs.writeShellApplication {
        name = "display-setup";
        runtimeInputs = [ pkgs.xorg.xrandr pkgs.gnugrep ];
        text = builtins.readFile ./scripts/display-setup.sh;
      };
      
      toggle-service = pkgs: pkgs.writeShellApplication {
        name = "toggle-service";
        runtimeInputs = [ pkgs.systemd ];
        text = builtins.readFile ./scripts/toggle-service.sh;
      };
    };
  in  
    {
      nixosConfigurations.nixOS = nixpkgs.lib.nixosSystem {
        
        specialArgs = { inherit inputs; };
        
        modules = [
          (import ./hosts { system = "nixOS"; })
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.hoarfrost = {
                imports = [ 
                  ./users/hoarfrost/home.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
              extraSpecialArgs = { 
                inherit zen-browser;
                inherit zed-editor-input; 
                inherit myScripts; 
              };
              backupFileExtension = ".bak";
            };
          }
        ];
      };
    };
}
