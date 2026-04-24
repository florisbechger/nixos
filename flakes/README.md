# nixos

# FLAKES

Create a remote server on KVM

1) Spin up a minimal NixOS VM change password on nixos user and copy its IP address

2) To sepearate Flakes from your Host (inside /etc/nixos) you need to create a local folder in your Home directory:

- mkdir -p /home/[username]/nixos/flakes

3) Copy flake.nix and flake.txt (for instructions) into the main flakes-directory

4) Create a directory "modules" and "misc" in this directory:

- mkdir -p /home/[username]/nixos/flakes/modules /home/[username]/nixos/flakes/misc

5) Copy .nix files into modules and misc

6) follow example commands on flake.txt, change ip- and username

7) Notice

- Adjust your settings in flake.nix
- SSH is turned on by default
- 'flake.nix' can not find a file in the previous folder
