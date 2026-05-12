
{ ... }:

# Wireless laptop: wlp0s20f3
# Wireless NUC: ...
# NIC laptop: enp0s31f6
# NIC NUC: enp86s0
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
  networking.interfaces.wlp0s20f3.useDHCP = true;
  networking.interfaces.enp0s31f6.useDHCP = true;
}
