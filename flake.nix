{
  description = "hoarfrost's NixOS config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    catppuccin = {
      url = "github:catppuccin/nix";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, catppuccin, ... }:
    {
      nixosConfigurations.nixOS = nixpkgs.lib.nixosSystem {
        modules = [
          #(nixpkgs.lib.mkOverride 10 (nixos-hardware.nixosModules.lenovo-legion-15ach6h // {
          #  hardware.nvidia.powerManagement.enable = false;
          #}))
          (import ./hosts { system = "nixOS"; })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.hoarfrost = {
              imports = [ 
                ./users/hoarfrost/home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
            home-manager.backupFileExtension = ".bak";
          }
        ];
      };
    };
}
