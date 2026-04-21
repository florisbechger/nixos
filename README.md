# nixos

# Some examples to get you started with NixOS

1) Download the Graphical ISO image from https://nixos.org/download and install this in a virtual machine or on hardware.

2) Create a working laptop/server with these example configuration.nix and modules:

- Copy configuration.nix to your local /etc/nixos directory

3) Create a directory "modules" in this directory:

- sudo mkdir /etc/nixos/modules

4) Copy all /module files to your local /etc/nixos/modules directory

5) Issue this command:

- sudo nixos-rebuild switch

6) Notice

- Allways choose a 'boot' and 'laptop/vm1' file in your configuration.nix & simply comment out what you want to install in configuration.nix
- Adjust your hardware-configuration.nix in /etc/nixos only if needed, otherwise do not overwrite it if it is allready configured!
