# nixos

FLAKES

To sepearate Flakes from your main Deploy (inside /etc/nixos) you need to create a local folder in your Home directory.
Create also a new 'modules' directory. This can be a copy of the original /etc/nixos/modules folder.
('flake.nix' can not find a file in the previous folder)
