#! /bin/bash

# https://itsfoss.com/things-to-do-after-installing-nixos
nix-channel --update # updating to the latest version of the NixOS channel
nixos-rebuild switch --upgrade

