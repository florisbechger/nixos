# nixos

# FLAKES

1) Change the "username" in "~/flakes/modules/admin.nix"

- Default username is 'admin'
- Default password is 'passwd'

2) Issue this command:

- nix run github:nix-community/nixos-anywhere -- admin@192.168.122.x --flake .#vm

3) Notes

- Alpha phase

- Simply comment out what you do not want to install in flake.nix
- Virtual machines in KVM use 'mbt' to boot properly in this setup
- SSH is turned on by default
