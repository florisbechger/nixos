
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, disko, ... }: {
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({modulesPath, ... }: {
          imports = [

            "${modulesPath}/installer/scan/not-detected.nix"
            "${modulesPath}/profiles/qemu-guest.nix"
              disko.nixosModules.disko

              ./modules/admin.nix
              ./modules/admin.applications.nix

              ./modules/boot.mbr.nix
              ./modules/disko.mbr.nix
              ./modules/ssh.enable.nix

              ./modules/vm.hostname.nix
              ./modules/vm.dhcp.nix

              ./modules/system.nix
              ./modules/services.nix

              ./modules/alsa.nix
              #./modules/bluetooth.nix
              ./modules/applications.nix
              ./modules/clamav.nix
              ./modules/firewall.nix
              #./modules/print.nix

              ./modules/packages.nix
              ./modules/flatpak.nix
              ./modules/gnome.nix
          ];
        })
      ];
    };
  };
}
