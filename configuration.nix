
{ ... }:

{

  imports =
    [
      ./hardware-configuration.nix

      ./modules/boot.esp.nix
      ./modules/ssh.disable.nix

      ./modules/ws.hostname.nix
      ./modules/ws.dhcp.nix

      ./modules/system.nix
      ./modules/services.nix

      ./modules/admin.nix
      ./modules/admin.applications.nix

      ./modules/alsa.nix
      ./modules/bluetooth.nix
      ./modules/clamav.nix
      ./modules/firewall.nix
      ./modules/print.nix

      ./modules/packages.nix
      ./modules/gnome.nix
      ./modules/applications.nix
      ./modules/flatpak.nix
      ./modules/flakes.nix
      ./modules/kvm.nix

      ./misc/github-desktop.nix
    ];
}
