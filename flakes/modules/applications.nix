
{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install firefox.
  programs.firefox.enable = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  angryipscanner
  librewolf
  rpiboot
  rpi-imager
  tidal-hifi
  virt-manager
  ];

}
