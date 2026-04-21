
{ config, pkgs, ... }:

{

  # Hostname.
  networking.hostName = "vm1";

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Disable Root login.
  #users.users.root.shell = "/sbin/nologin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Garbage collection.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 60d";
  };

  # Automatic system upgrade.
  system.autoUpgrade.enable = false;
  system.autoUpgrade.allowReboot = false;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-25.11";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # This value determines the NixOS release.
  system.stateVersion = "25.11";

}
