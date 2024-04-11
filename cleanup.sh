#! /bin/sh

# NixOS cleanup
nix-collect-garbage -d
nix-store --optimise
nixos-rebuild switch

