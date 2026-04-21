
#! /usr/bin/env nix-shell

# NixOS cleanup
nix-collect-garbage
nix-collect-garbage -d
nix-store --optimise
nixos-rebuild boot
nixos-rebuild switch
