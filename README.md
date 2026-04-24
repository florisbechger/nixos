# nixos

# Some examples to get you started with NixOS

1) Download the Graphical ISO image from https://nixos.org/download and install this in a virtual machine or on hardware (laptop as an example here).

2) Create a working workstation/server with these example configuration.nix and modules:

- Copy configuration.nix to your local /etc/nixos directory

3) Create a directory "modules" and "misc" in this directory:

- sudo mkdir /etc/nixos/modules /etc/nixos/misc

4) Copy all /module files to your local /etc/nixos/modules and /etc/nixos/misc directory

5) Add, change or rename module/misc files when needed and reference them in your configuration.nix file.

6) Issue this command:

- sudo nixos-rebuild switch

7) Notice

- Adjust your hardware-configuration.nix in /etc/nixos only if needed, otherwise do not overwrite it if it is allready configured!
- Allways choose a 'boot' and 'laptop' or 'vm1' file in your configuration.nix & simply comment out what you want to install in configuration.nix
- Virtual machines in KVM uses 'mbt' by default, for deploying on most hardware you can choose 'esp'.
- SSH is turned off by default, but can be turned on in the services.nix file: replace 'false' to 'true'

8) Enjoy NixOS
