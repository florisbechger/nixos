# Example

{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        vm1 = lib.nixosSystem {
          inherit system;
          modules = [ ./vm1/configuration.nix ];
        };
        vm2 = lib.nixosSystem {
          inherit system;
          modules = [ ./vm2/configuration.nix ];
        };
      };
    };
}
