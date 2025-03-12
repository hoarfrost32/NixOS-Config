{
  description = "hoarfrost's NixOS config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    catppuccin = {
      url = "github:catppuccin/nix";
    };
  };

  outputs = { self, nixpkgs, zen-browser, home-manager, nixos-hardware, catppuccin, ... } @ inputs:
    {
      nixosConfigurations.nixOS = nixpkgs.lib.nixosSystem {
        
        specialArgs = { inherit inputs; };
        
        modules = [
          #(nixpkgs.lib.mkOverride 10 (nixos-hardware.nixosModules.lenovo-legion-15ach6h // {
          #  hardware.nvidia.powerManagement.enable = false;
          #}))
          (import ./hosts { system = "nixOS"; })
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.hoarfrost = {
                imports = [ 
                  ./users/hoarfrost/home.nix
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
              extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
              backupFileExtension = ".bak";
            };
          }
        ];
      };
    };
}
