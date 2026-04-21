
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

            ./modules/vm1.nix
            ./modules/vm1.dhcp.nix
            #./modules/vm1.static.nix
            #./modules/vm1.bridged.nix

            ./modules/boot-mbr.nix # for VM
            ./modules/disko-mbr.nix # for VM
            #./modules/disko-extra.nix

            ./modules/users.nix
            ./modules/firewall.nix
            ./modules/services.nix
            ./modules/packages.nix
            ./modules/clamav.nix

            #./modules/ollama2.nix

          ];
        })
      ];
    };
  };
}
