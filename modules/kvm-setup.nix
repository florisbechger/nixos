# Untested

{ pkgs, ... }:

{

  system.activationScripts.extraActivation.text = ''
  # Set Storage pool.
      mkdir -p /data/backup # Backup
      chgrp libvirtd /data/backup
      chmod g+w /data/backup
      mkdir -p /data/images # Images (default)
      chgrp libvirtd /data/images
      chmod g+w /data/images
      mkdir -p /data/iso # ISO
      chgrp libvirtd /data/iso
      chmod g+w /data/iso

    # Enable the default network automatically at boot.
      virsh --connect qemu:///system net-autostart default

    # Define and start pools if it doesn't exist.
      if ! ${pkgs.libvirt}/bin/virsh pool-info backup >/dev/null 2>&1; then
        ${pkgs.libvirt}/bin/virsh pool-define-as backup dir --target /data/backup
        ${pkgs.libvirt}/bin/virsh pool-autostart backup
        ${pkgs.libvirt}/bin/virsh pool-start backup
      fi
      if ! ${pkgs.libvirt}/bin/virsh pool-info default >/dev/null 2>&1; then
        ${pkgs.libvirt}/bin/virsh pool-define-as default dir --target /data/images
        ${pkgs.libvirt}/bin/virsh pool-autostart default
        ${pkgs.libvirt}/bin/virsh pool-start default
      fi
      if ! ${pkgs.libvirt}/bin/virsh pool-info iso >/dev/null 2>&1; then
        ${pkgs.libvirt}/bin/virsh pool-define-as iso dir --target /data/iso
        ${pkgs.libvirt}/bin/virsh pool-autostart iso
        ${pkgs.libvirt}/bin/virsh pool-start iso
      fi

  # Set bridge network.
    # Wait for libvirtd to be ready
    while ! ${pkgs.libvirt}/bin/virsh list >/dev/null 2>&1; do
      sleep 1
    done
      
    # Create bridge network if it doesn't exist.
    if ! ${pkgs.libvirt}/bin/virsh net-info virbr1 >/dev/null 2>&1; then
      cat > /tmp/virbr1.xml << EOF
      <network>
        <name>virbr1</name>
        <forward mode='bridge'/>
        <bridge name='virbr1'/>
      </network>
      EOF

      ${pkgs.libvirt}/bin/virsh net-define /tmp/virbr1.xml
      #${pkgs.libvirt}/bin/virsh net-autostart virbr1
      #${pkgs.libvirt}/bin/virsh net-start virbr1
      rm /tmp/virbr1.xml
    fi

  '';

}
