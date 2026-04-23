
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/alsa.nix
      ./modules/applications.nix
      ./modules/bluetooth.nix

      ./modules/boot-esp.nix
      ./modules/clamav.nix
      ./modules/firewall.nix
      ./modules/flakes.nix
      ./modules/flatpak.nix
      ./modules/gnome.nix
      ./modules/kvm.nix

      ./modules/laptop.dhcp.nix
      ./modules/laptop.nix
      ./modules/packages.nix
      ./modules/print.nix
      ./modules/services.nix

    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.floris = {
    isNormalUser = true;
    description = "Floris";
    extraGroups = [ "audio" "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
    # some package
    ];
  };

}
