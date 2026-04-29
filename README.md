# nixos

# Some examples to get you started with NixOS

1) Download the Graphical ISO image from https://nixos.org/download and install this in a virtual machine or on hardware (laptop as an example here).

2) Create a working workstation/server with these example configuration.nix and modules into this virtual machine or hardware (laptop as an example here):

- Copy configuration.nix to your local "/etc/nixos" directory
- Leave your allready default "hardware-configuration.nix" untouched

3) Change the "username" in users.nix

4) Create a directory "modules" your local "/etc/nixos" directory

- sudo mkdir /etc/nixos/modules

5) Copy all /module files to your local "/etc/nixos/modules" directory

6) Add, change or rename module files when needed and reference them in your configuration.nix file.

7) Issue this command:

- sudo nixos-rebuild switch

8) Notice

- Adjust your hardware-configuration.nix in /etc/nixos only if needed, otherwise do not overwrite it if it is allready configured!
- Allways choose a 'boot' and 'laptop' or 'vm1' file in your configuration.nix & simply comment out what you want to install in configuration.nix
- Virtual machines in KVM uses 'mbt' by default, for deploying on most hardware you can choose 'esp'.
- SSH is turned off by default, but can be turned on in the configuration.nix file: replace "ssh.disable.nix" to "ssh.enable.nix"
