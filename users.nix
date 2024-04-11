
{ config, pkgs, ... }:

let
  user1 = "dummy";
in

{
  imports =
    [
      ./hardware-configuration.nix
    ];

   # Define user accounts:
  users.users.${user1} = {
    isNormalUser = true;
    description = "${user1}";
    extraGroups = [ "kvm" "libvirtd" "networkmanager" "wheel" ];
    initialPassword = "passwd";
    uid = 1000;
    createHome = true;
    shell = "/run/current-system/sw/bin/bash";
    packages = with pkgs; [
    
      gnomeExtensions.dashbar
      gnomeExtensions.disk-usage
      gnomeExtensions.ip-finder
      gnomeExtensions.lan-ip-address
      gnomeExtensions.logo-menu
      gnomeExtensions.thinkpad-thermal
      gnomeExtensions.transparent-window-moving
      gnome.gnome-tweaks

      #megasync
      #nomachine-client
      #slack
      #thunderbird
      #vscode

    ];
  };

}

