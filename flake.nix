{
  description = "MrGoogle personal nixos configuration.";

# Declaring package sources
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, nix-flatpak, disko, home-manager, ... }: {
    nixosConfigurations = {

      NixBoy = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs.flake-inputs = inputs;
            home-manager.users.mrgoogle.imports = [
              nix-flatpak.homeManagerModules.nix-flatpak
              ./hosts/NixBoy/home/mrgoogle/home.nix
            ];
          }
          ./hosts/NixBoy/configuration.nix
          disko.nixosModules.disko
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
              ./home/vmboy/nixos.nix
            ];
#            home-manager.users.vmboy = import ./hosts/nixos/home/home.nix;
          }
          ./hosts/nixos/configuration.nix
          disko.nixosModules.disko
        ];
      };

    };
  };
}
