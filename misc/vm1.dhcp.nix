
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

  # Use DHCP.
  networking.interfaces.enp1s0.useDHCP = true; # NIC VM

}
