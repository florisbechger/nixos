# nixos

# FLAKES

Read the flakes.txt to install a complete virtual server in KVM (a virtual libvirtd/qemu environment) or on physical hardware.

1) To sepearate Flakes from your main Deploy (inside /etc/nixos) you need to create a local folder in your Home directory:

- mkdir -p /home/[username]/nixos/flakes

2) Copy flake.nix and flake.txt (for instructions) into the main flakes-directory

3) Create a directory "modules" in this directory:

- sudo mkdir -p /home/[username]/nixos/flakes/modules

4) Copy .nix module-files into modules:

- sudo cp /etc/nixos/modules/*.nix /home/[username]/nixos/flakes/modules

(This can be a copy of the original /etc/nixos/modules folder)

5) Notice

- 'flake.nix' can not find a file in the previous folder
