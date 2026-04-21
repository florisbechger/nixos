# nixos

# FLAKES

Read the flakes.txt to install a complete virtual server in KVM (a virtual libvirtd/qemu environment) or on physical hardware.

1) To sepearate Flakes from your main Deploy (inside /etc/nixos) you need to create a local folder in your Home directory:

- mkdir -p /home/[username]/nixos/flakes

2) Create also a new 'modules' directory. This can be a copy of the original /etc/nixos/modules folder:

- mkdir -p /home/[username]/nixos/flakes/modules

3) Notice

- 'flake.nix' can not find a file in the previous folder
