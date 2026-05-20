
{ pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Install packages in system profile.
  environment.systemPackages = with pkgs; [
    angryipscanner
    rpiboot
    rpi-imager
    virt-manager
  ];
}
