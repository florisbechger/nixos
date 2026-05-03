# nixos

# NixOS Workstation with remote Flake deploy on a VM
(How to set up a NixOS workstation and prepare it to commit a deploy on a barebones VM on KVM)

1) Download the Graphical ISO image from https://nixos.org/download and install this through the graphical installer in a virtual machine or on hardware (laptop as an example here).

2) Change the default working workstation/server with these example configuration.nix and modules:

- Copy configuration.nix to your local "/etc/nixos" directory
- Leave your default "hardware-configuration.nix" untouched

3) Create a new directory "modules" into your local "/etc/nixos" directory:

- sudo mkdir /etc/nixos/modules

4) Copy all /module files to your local "/etc/nixos/modules" directory

5) Change the "username" in "/etc/nixos/modules/users.nix"

- Default username is 'admin'
- Default password is 'passwd'

6) Reference module files in your configuration.nix file.

7) Issue this command:

- sudo nixos-rebuild switch

8) Note

- Do not overwrite your working hardware-configuration.nix in /etc/nixos, adjust only when needed
- Allways choose a 'boot' and 'laptop' or 'vm' file in your configuration.nix & simply comment out what you want to install in configuration.nix
- Virtual machines in KVM use 'mbt' to boot properly by default
- For deploying on most hardware you can choose 'esp'.
- SSH is turned off by default, but can be turned on in the configuration.nix file: replace "ssh.disable.nix" to "ssh.enable.nix"
