
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, disko, ... }: {
    nixosConfigurations.vm1 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({modulesPath, ... }: {
          imports = [

            "${modulesPath}/installer/scan/not-detected.nix"
            "${modulesPath}/profiles/qemu-guest.nix"
            disko.nixosModules.disko

            ./modules/boot-mbr.nix # also include disko-mbr.nix for disk preparation
            ./modules/firewall.nix
            ./modules/packages.nix
            ./modules/services.nix
            ./modules/clamav.nix

            ./misc/disko-mbr.nix
            ./misc/vm1.nix
            ./misc/vm1.dhcp.nix
            ./misc/users.nix

          ];
        })
      ];
    };
  };
}
