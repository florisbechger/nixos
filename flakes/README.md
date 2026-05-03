# nixos

# FLAKES

(Deploy a remote server on KVM, managed only through a local workstation through flake)

1) Spin up a minimal NixOS VM change password on nixos user and copy its IP address

2) To seperate Flakes from your Host (inside /etc/nixos) you need to create a separate folder:

- mkdir /etc/nixos/flakes or ~/flakes

3) Copy flake.nix and flake.txt (for instructions) into the main flakes-directory

4) Create a new directory "modules" in this directory:

- mkdir /etc/nixos/flakes/modules or ~/flakes/modules

5) Copy all module/.nix files into "/etc/nixos/flakes/modules" or "~/flakes/modules"

6) Change the "username" in "/etc/nixos/flakes/modules/users.nix" or "~/flakes/modules/users.nix"

- Default username is 'admin', can be changed in your own name
- default password is 'passwd'

7) follow example commands on flake.txt, change ip-address and username

- nix run github:nix-community/nixos-anywhere -- floris@192.168.122.x --flake .#vm

8) Note

- Adjust your settings in flake.nix
- SSH is turned on by default, also for root
