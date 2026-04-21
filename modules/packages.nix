
{ pkgs, config, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
