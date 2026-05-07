# nixos

## Unser construction ##

# FLAKES

1) Change networkconnectivity in "flake.nix"

2) Change the "hostname" in "/etc/nixos/flakes/modules/vm.hostname.nix"

- Default hostname is 'virtualmachine'

3) Change the "username" in "/etc/nixos/flakes/modules/users.nix"

- Default username is 'admin'
- Default password is 'passwd'

4) Issue this command (change ip-address and username):

- nix run github:nix-community/nixos-anywhere -- admin@192.168.122.x --flake .#vm

5) Note

- Simply comment out what you do not want to install in flake.nix
- Virtual machines in KVM use 'mbt' to boot properly in this setup
- SSH is turned on by default
- Follow example commands on flake.txt
