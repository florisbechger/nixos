
{ ... }:

# Wireless laptop: wlp0s20f3
# NIC laptop: enp0s31f6
# Wireless NUC: ...
# NIC nuc: enp86s0
# NIC VM: enp1s0

{

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking.
  networking.enableIPv6 = false;
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" ];

  # Default Gateway.
  networking.defaultGateway  = "192.168.0.1";

  # Use DHCP.
  networking.interfaces.enp0s31f6.useDHCP = false;

  # Static networking on NIC.
  networking.interfaces.enp0s31f6.ipv4.addresses = [ {
    address = "192.168.0.110";
    prefixLength = 24;
  } ];

}
