{ pkgs, ... }:

{

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
    onBoot = "start";
    onShutdown = "shutdown";
    parallelShutdown = 0;
    shutdownTimeout = 30;

    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true; # Doesn't actually run as root because of overriding config below.
      swtpm.enable = true; # Required for Windows 11 TPM
      vhostUserPackages = [ pkgs.virtiofsd ]; # NEW
      verbatimConfig = 
      ''
        namespaces = []
        user = "floris"
        group = "users"
      '';
    };
  };

  # KVM Nested options.
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  # KVM Options.
  programs.dconf.enable = true;

/*
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
*/

}
