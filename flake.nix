{
  description = "hoarfrost's NixOS config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixOS = nixpkgs.lib.nixosSystem {
        modules = [
          (import ./hosts { system = "nixOS"; })
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.hoarfrost = import ./users/hoarfrost/home.nix;
          }
        ];
      };
    };
}
