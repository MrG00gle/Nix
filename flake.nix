{
  description = "MrGoogle personal nixos configuration.";

# Declaring package sources
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nix-flatpak, home-manager, ... }: {
    nixosConfigurations = {

      NixBoy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
#          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs.flake-inputs = inputs;
            home-manager.users.mrgoogle = import ./hosts/NixBoy/home/home.nix;
          }
          ./hosts/NixBoy/configuration.nix
        ];
      };

      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs.flake-inputs = inputs;
            home-manager.users.vmboy.imports = [
              nix-flatpak.homeManagerModules.nix-flatpak
              ./hosts/nixos/home/home.nix
            ];
#            home-manager.users.vmboy = import ./hosts/nixos/home/home.nix;
          }
          ./hosts/nixos/configuration.nix
        ];
      };

    };
  };
}