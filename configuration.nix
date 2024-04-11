# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  networking.enableIPv6  = false;

  # Enable fixed ip on enp86s0
  #networking.interfaces.enp86s0.ipv4.addresses = [ {
    #address = "192.168.0.25";
    #prefixLength = 24;
  #} ];

  # Enable bridge with fixed ip
  #networking.bridges = {
    #"br0" = {
      #interfaces = [ "enp86s0" ];
    #};

  # Enable fixed ip on bridge
  #networking.interfaces.br0.ipv4.addresses = [ {
    #address = "192.168.0.25";
    #prefixLength = 24;
  #} ];

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

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

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.floris = {
    isNormalUser = true;
    description = "floris";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    htop
    neofetch
    nmap
    parted
    tree
    wget

    bridge-utils
    cdrtools
    guestfs-tools
    libguestfs
    libvirt
    qemu_kvm

  ];

  # KVM options:
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  services.qemuGuest.enable = true;
  # KVM nested options:
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  # List services that you want to enable:
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  services.fstrim.enable = true;
  services.mpd.enable = false; # https://nixos.wiki/wiki/MPD
  services.nagios.enable = false; # https://nixos.wiki/wiki/Nagios
  services.fail2ban.enable = false; # https://nixos.wiki/wiki/Fail2ban
  services.flatpak.enable = false; # https://nixos.org/manual/nixos/stable/#module-services-flatpak

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Automatic Upgrades.
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-23.11;
  system.autoUpgrade.enable = false;
  system.autoUpgrade.allowReboot = false;

  # Automatic Garbage Collection.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Last entries.
  system.copySystemConfiguration = true;
  system.stateVersion = "23.11";

}
