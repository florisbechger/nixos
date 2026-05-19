
#!/run/current-system/sw/bin/bash

# Run this script to create alternative Storage locations on KVM

# Set Storage pools.
if ! ls /data/backup > /dev/null 2>&1; then mkdir -p /data/backup; fi
if ! ls /data/images > /dev/null 2>&1; then mkdir -p /data/images; fi
if ! ls /data/iso > /dev/null 2>&1; then mkdir -p /data/iso; fi

# Set Storage group.
chgrp libvirtd /data/backup
chmod g+w /data/backup

chgrp libvirtd /data/images
chmod g+w /data/images

chgrp libvirtd /data/iso
chmod g+w /data/iso

# Define Storage pools.
virsh pool-destroy default # stop de default pool
virsh pool-undefine default

virsh pool-define-as backup dir --target /data/backup
virsh pool-define-as default dir --target /data/images
virsh pool-define-as iso dir --target /data/iso

# Start Storage pools.
virsh pool-start default
virsh pool-start backup
virsh pool-start iso

# Enable Storage pools.
virsh pool-autostart default
virsh pool-autostart backup
virsh pool-autostart iso
