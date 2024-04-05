
# Howto enable KVM

  environment.systemPackages = with pkgs; [

    # KVM
    bridge-utils
    cdrtools
    guestfs-tools
    libguestfs
    libvirt
    qemu_kvm
    virt-manager

  ];

  # KVM options:
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  # boot.kernelModules = [ "kvm-intel" ];

  # KVM nested options:
  boot.extraModprobeConfig = "options kvm_intel nested=1";

