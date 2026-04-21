
{ ... }:

# Wireless laptop: wlp0s20f3
# NIC laptop: enp0s31f6
# Wireless NUC: ...
# NIC nuc: enp86s0
# NIC VM: enp1s0

{

  # Enable networking.
  networking.enableIPv6 = false;
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" ];

  # Default Gateway.
  networking.defaultGateway  = "192.168.0.1";

  # Use DHCP.
  networking.interfaces.br0.useDHCP = false;

  # Bridged networking on NIC.
  networking.bridges = {
    "br0" = {
      interfaces = [ "enp1s0" ];
    };
  };
  networking.interfaces.br0.ipv4.addresses = [ {
    address = "192.168.0.110";
    prefixLength = 24;
  } ];

}
