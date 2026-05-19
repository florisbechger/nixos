{ pkgs, config, lib, ... }:

  let
    service = "qemu";
  in

{

  # Add user from "admin.nix" to allow interaction with the daemon.
  users.users.${config.users.admin}.extraGroups = [ "libvirtd" ];

  # Create group
  users.groups.${service} = {};

  # Create user
  users.users.${service} = {
    isSystemUser = true;
    description = "${service}";
    group = "${service}";
    shell = "/usr/bin/nologin"; # No shell
    createHome = false; # No homedirectory
    password = "!"; # No password
    #packages = with pkgs; [
    # some package
    #];
  };

  # Load appropiate kernel module.
  boot.kernelModules = [ "kvm-intel" ]; # "kvm-amd"

  # System packages.
  environment.systemPackages = with pkgs; [
  bridge-utils
  cdrtools
  dnsmasq
  guestfs-tools
  libguestfs
  libvirt
  qemu_kvm
  ];

  # Virtualisation (https://nixos.wiki/wiki/Libvirt ; https://mynixos.com/options/virtualisation.libvirtd).
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    parallelShutdown = 0;
    shutdownTimeout = 30;

    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true; # Required for Windows 11 TPM
      vhostUserPackages = [ pkgs.virtiofsd ]; # NEW
      runAsRoot = true; # Doesn't actually run as root because of overriding config below.
      verbatimConfig = 
      ''
        namespaces = []
        user = "${service}"
        group = "${service}"
      '';
    };
  };

  # KVM options.
  programs.dconf.enable = true;

  # KVM nested options.
  boot.extraModprobeConfig = "options kvm_intel nested=1";

}
