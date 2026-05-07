
{ ... }:

{

  imports =
    [
      ./hardware-configuration.nix

      ./modules/default.nix
      ./modules/admin.nix
      ./modules/groups.admin.nix
      ./modules/special.nix
      ./modules/groups.special.nix

      ./modules/boot.esp.nix
      ./modules/ssh.disable.nix

      ./modules/ws.hostname.nix
      ./modules/ws.dhcp.nix
      ./modules/system.nix
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
