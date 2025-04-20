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
    zen-browser.url = "github:0xc000022070/zen-browser-flake/165ee672e6b17a8bcc0a3fb51fab3f79715cc1f3";
  };
  
  outputs = { self, nixpkgs, zen-browser, home-manager, nixos-hardware, catppuccin, zed-editor-input, ... } @ inputs:
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
              extraSpecialArgs = { inherit inputs; inherit zed-editor-input; system = "x86_64-linux"; };
              backupFileExtension = ".bak";
            };
          }
        ];
      };
    };
}
