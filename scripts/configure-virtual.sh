
# Remote configure vm script

ssh admin@192.168.122.213
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /etc/nixos/modules/boot.mbr.nix
sudo nixos-generate-config
exit
sudo scp -r /etc/nixos/modules* admin@192.168.122.213:~
sudo scp /etc/nixos/remote/configuration.nix admin@192.168.122.213:~
ssh admin@192.168.122.213 "sudo chown -R root:root *"
ssh admin@192.168.122.213 "sudo mv * /etc/nixos"
ssh admin@192.168.122.213 "sudo nixos-rebuild switch"

# Print detected hardware configuration to standard output without writing to disk:
ssh admin@192.168.122.213 "nixos-generate-config --show-hardware-config"

# This is typically used where NixOS is already installed:
ssh admin@192.168.122.213 "sudo nixos-generate-config"
