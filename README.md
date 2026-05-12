
# NixOS with remote Flake deploy on KVM

# Workstation (config)

1) Change the "username" in "/etc/nixos/modules/admin.nix"

- Default username is 'admin'
- Default password is 'passwd'

2) Issue this command:

- sudo nixos-rebuild switch

3) Note

- Do not overwrite your working hardware-configuration.nix in /etc/nixos, adjust only when needed
- Simply comment out what you do not want to install in configuration.nix
- For deploying on most hardware you can choose 'esp'.
- Virtual machines in KVM use 'mbt' to boot properly in this setup
- SSH is turned off by default, but can be turned on in the configuration.nix file: replace "ssh.disable.nix" to "ssh.enable.nix"
- Change root password and login!
