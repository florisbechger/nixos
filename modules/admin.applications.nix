
{ pkgs, ... }:

{

  # Install packages in system profile.
  environment.systemPackages = with pkgs; [
    angryipscanner
    rpiboot
    rpi-imager
    virt-manager
  ];
}
