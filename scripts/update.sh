
#! /usr/bin/env nix-shell

## Update Packages ##
# https://itsfoss.com/things-to-do-after-installing-nixos

nix-channel --list
# nixos https://nixos.org/channels/nixos-25.11
nix-channel --update
# updating to the latest stable version of the NixOS channel
nixos-rebuild switch --upgrade

## Update System ##
# https://www.splitbrain.org/blog/2025-12/01-my_first_nixos_upgrade

nix-channel --list
# nixos https://nixos.org/channels/nixos-25.11
nix-channel --add https://nixos.org/channels/nixos-25.11 nixos
nix-channel --list
# nixos https://nixos.org/channels/nixos-25.11
nix-channel --update
nixos-rebuild boot --upgrade
# reboot
