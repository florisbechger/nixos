
#{ config, pkgs, modulesPath, lib, ... }:
{ pkgs, modulesPath, ... }:

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  # use the latest Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

/*
  environment.systemPackages = with pkgs; [
    iproute2     # ip, ss
    iputils      # ping, arping
    nmap         # discover hosts on the LAN
    openssh      # ssh client
  ];
*/

/*
  networking.wireless = {
    enable = true;
    interfaces = [ "wlp0s20f3" ]; # Laptop
  };
*/

  time.timeZone              = "Europe/Amsterdam";
  i18n.defaultLocale         = "en_US.UTF-8";

  users.users.admin = {
    isNormalUser = true;
    extraGroups  = [ "wheel" "networkmanager" ];

    # Set an initial password with:
    # mkpasswd -m sha-512 'your-password'
    # and paste the hash below, OR use initialPassword for plain text (less secure).
    initialPassword = "passwd";   # ← (or replace with hashedPassword)
  };

  # Allow Unfree software.
  nixpkgs.config.allowUnfree = true;

}
