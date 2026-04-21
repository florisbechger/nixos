
#! /usr/bin/env nix-shell

sudo systemctl status libvirtd
sudo systemctl stop libvirtd*
sudo systemctl start libvirtd

# BRIDGE
sudo cat <<EOF > /tmp/virbr10.xml
<network>
  <name>bridge</name>
  <bridge name="virbr10"/>
  <forward mode="bridge"/>
  <bridge name="bridge"/>
</network>
EOF

sudo virsh net-define /tmp/virbr10.xml
sudo rm /tmp/virbr10.xml

sudo virsh net-start bridge
sudo virsh net-autostart bridge
sudo ip link set bridge up

# CONTROL
sudo cat <<EOF > /tmp/virbr11.xml
<network>
  <name>control</name>
  <forward mode="nat">
    <nat>
      <port start="22" end="65535"/>
    </nat>
  </forward>
  <bridge name="virbr11" stp="on" delay="0"/>
  <ip address="10.10.0.1" netmask="255.255.255.0">
    <dhcp>
      <range start="10.10.0.10" end="10.10.0.254"/>
    </dhcp>
  </ip>
</network>
EOF

sudo virsh net-define /tmp/virbr11.xml
sudo rm /tmp/virbr11.xml

sudo virsh net-start control
sudo virsh net-autostart control
sudo ip link set control up

# PRIVATE
sudo cat <<EOF > /tmp/virbr12.xml
<network>
  <name>private</name>
  <forward mode="nat">
    <nat>
      <port start="22" end="65535"/>
    </nat>
  </forward>
  <bridge name="virbr12" stp="on" delay="0"/>
  <ip address="10.20.0.1" netmask="255.255.255.0">
    <dhcp>
      <range start="10.20.0.10" end="10.20.0.254"/>
    </dhcp>
  </ip>
</network>
EOF

sudo virsh net-define /tmp/virbr12.xml
sudo rm /tmp/virbr12.xml

sudo virsh net-start private
sudo virsh net-autostart private
sudo ip link set private up

# STORAGE
sudo cat <<EOF > /tmp/virbr13.xml
<network>
  <name>storage</name>
  <forward mode="nat">
    <nat>
      <port start="22" end="65535"/>
    </nat>
  </forward>
  <bridge name="virbr13" stp="on" delay="0"/>
  <ip address="10.30.0.1" netmask="255.255.255.0">
    <dhcp>
      <range start="10.30.0.10" end="10.30.0.254"/>
    </dhcp>
  </ip>
</network>
EOF

sudo virsh net-define /tmp/virbr13.xml
sudo rm /tmp/virbr13.xml

sudo virsh net-start storage
sudo virsh net-autostart storage
sudo ip link set storage up

# PUBLIC
sudo cat <<EOF > /tmp/virbr15.xml
<network>
  <name>public</name>
  <forward mode="nat">
    <nat>
      <port start="22" end="65535"/>
    </nat>
  </forward>
  <bridge name="virbr15" stp="on" delay="0"/>
  <ip address="10.50.0.1" netmask="255.255.255.0">
    <dhcp>
      <range start="10.50.0.10" end="10.50.0.254"/>
    </dhcp>
  </ip>
</network>
EOF

sudo virsh net-define /tmp/virbr15.xml
sudo rm /tmp/virbr15.xml

sudo virsh net-start public
sudo virsh net-autostart public
sudo ip link set public up

