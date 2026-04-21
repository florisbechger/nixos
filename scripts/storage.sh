
#! /usr/bin/env nix-shell

# Create custom storage directories.
mkdir -p /data/images #(default)
mkdir -p /data/backup
mkdir -p /data/iso

chmod g+w /data/images
chmod g+w /data/backup
chmod g+w /data/iso

chgrp libvirtd /data/images
chgrp libvirtd /data/backup
chgrp libvirtd /data/iso

ls -laht /data

#chown root:libvirtd /data/*

# Define pools.
virsh pool-destroy default
#virsh pool-undefine default
virsh pool-define-as default dir --target /data/images
virsh pool-define-as backup dir --target /data/backup
virsh pool-define-as iso dir --target /data/iso

# Enable pools.
virsh pool-autostart default
virsh pool-autostart backup
virsh pool-autostart iso

# Start pools.
virsh pool-start default
virsh pool-start backup
virsh pool-start iso

## Automate:

# Define and start pools if it doesn't exist.
if ! virsh pool-info default >/dev/null 2>&1; then
  virsh pool-destroy default
  #virsh pool-undefine default
  virsh pool-define-as default dir --target /data/images
  virsh pool-start default
  virsh pool-autostart default
fi
if ! virsh pool-info backup >/dev/null 2>&1; then
  virsh pool-define-as backup dir --target /data/backup
  virsh pool-start backup
  virsh pool-autostart backup
fi
if ! virsh pool-info iso >/dev/null 2>&1; then
  virsh pool-define-as iso dir --target /data/iso
  virsh pool-start iso
  virsh pool-autostart iso
fi

