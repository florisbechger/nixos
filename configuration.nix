
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./modules/boot.esp.nix
      ./modules/ssh.disable.nix
      ./modules/users.nix

      ./modules/hostname.nix
      ./modules/system.nix
      ./modules/ws.dhcp.nix
      ./modules/services.nix

      ./modules/alsa.nix
      ./modules/bluetooth.nix
      ./modules/clamav.nix
      ./modules/firewall.nix
      ./modules/print.nix

      ./modules/applications.nix
      ./modules/packages.nix
      ./modules/flakes.nix
      ./modules/flatpak.nix
      ./modules/gnome.nix
      ./modules/kvm.nix

    ];

}
