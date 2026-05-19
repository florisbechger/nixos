
#!/run/current-system/sw/bin/bash
# (#! /usr/bin/env nix-shell)

# Run this script to create multiple networks on KVM

# BRIDGE
cat << EOF > /tmp/bridge.xml
  <network>
    <name>bridge</name>
    <bridge name="bridge"/>
    <forward mode="bridge"/>
    <bridge name="bridge"/>
  </network>
EOF

# CONTROL
cat << EOF > /tmp/control.xml
  <network>
    <name>control</name>
    <forward mode="nat">
      <nat>
        <port start="22" end="65535"/>
      </nat>
    </forward>
    <bridge name="control" stp="on" delay="0"/>
    <ip address="10.10.0.1" netmask="255.255.255.0">
      <dhcp>
        <range start="10.10.0.10" end="10.10.0.254"/>
      </dhcp>
    </ip>
  </network>
EOF

# PRIVATE
cat << EOF > /tmp/private.xml
  <network>
    <name>private</name>
    <forward mode="nat">
      <nat>
        <port start="22" end="65535"/>
      </nat>
    </forward>
    <bridge name="private" stp="on" delay="0"/>
    <ip address="10.20.0.1" netmask="255.255.255.0">
      <dhcp>
        <range start="10.20.0.10" end="10.20.0.254"/>
      </dhcp>
    </ip>
  </network>
EOF

# STORAGE
cat << EOF > /tmp/storage.xml
  <network>
    <name>storage</name>
    <forward mode="nat">
      <nat>
        <port start="22" end="65535"/>
      </nat>
    </forward>
    <bridge name="storage" stp="on" delay="0"/>
    <ip address="10.30.0.1" netmask="255.255.255.0">
      <dhcp>
        <range start="10.30.0.10" end="10.30.0.254"/>
      </dhcp>
    </ip>
  </network>
EOF

# PUBLIC
cat << EOF > /tmp/public.xml
  <network>
    <name>public</name>
    <forward mode="nat">
      <nat>
        <port start="22" end="65535"/>
      </nat>
    </forward>
    <bridge name="public" stp="on" delay="0"/>
    <ip address="10.50.0.1" netmask="255.255.255.0">
      <dhcp>
        <range start="10.50.0.10" end="10.50.0.254"/>
      </dhcp>
    </ip>
  </network>
EOF

virsh net-define /tmp/bridge.xml
virsh net-define /tmp/control.xml
virsh net-define /tmp/private.xml
virsh net-define /tmp/storage.xml
virsh net-define /tmp/public.xml

rm /tmp/bridge.xml
rm /tmp/control.xml
rm /tmp/private.xml
rm /tmp/storage.xml
rm /tmp/public.xml

virsh net-destroy default

#virsh net-start bridge
#virsh net-autostart bridge
#ip link set bridge up

virsh net-start control
virsh net-autostart control
ip link set control up

virsh net-start private
virsh net-autostart private
ip link set private up

virsh net-start storage
virsh net-autostart storage
ip link set storage up

virsh net-start public
virsh net-autostart public
ip link set public up
