# nixos

# NixOS Workstation with remote Flake deploy on a VM

1) Change networkconnectivity in "configuration.nix"

2) Change the "hostname" in "/etc/nixos/modules/ws.hostname.nix"

- Default hostname is 'workstation'

3) Change the "username" in "/etc/nixos/modules/admin.nix" and/or "/etc/nixos/modules/special.nix"

- Default username is 'admin' and 'guest'
- Default password is 'passwd'

4) Issue this command:

- sudo nixos-rebuild switch

5) Note

- Do not overwrite your working hardware-configuration.nix in /etc/nixos, adjust only when needed
- Simply comment out what you do not want to install in configuration.nix
- For deploying on most hardware you can choose 'esp'.
- Virtual machines in KVM use 'mbt' to boot properly in this setup
- SSH is turned off by default, but can be turned on in the configuration.nix file: replace "ssh.disable.nix" to "ssh.enable.nix"
