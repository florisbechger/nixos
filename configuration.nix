# Example

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/laptop.dhcp.nix
      ./modules/laptop.nix
      ./modules/p43s.nix
      ./modules/boot-esp.nix
      ./modules/bluetooth.nix
      ./modules/clamav.nix
      ./modules/firewall.nix
      ./modules/print.nix
      ./modules/alsa.nix
      ./modules/gnome.nix
      ./modules/packages.nix
      ./modules/applications.nix
      ./modules/services.nix
      ./modules/kvm.nix
      ./modules/flatpak.nix
      ./modules/flakes.nix
      ./modules/mega.nix
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
