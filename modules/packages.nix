
{ pkgs, ... }:

{
  # Install packages in system profile.
  environment.systemPackages = with pkgs; [
  #ansible
  #evince
  #fastfetch
  #git
  glances
  htop
  #iputils
  parted
  #pciutils
  tlp
  tree
  #util-linux
  #terraform
  #usbutils
  wget
  ];
}
