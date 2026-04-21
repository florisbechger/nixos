{ ... }:

{

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  #networking.firewall.allowedTCPPorts = [ 53 443 515 631 1752 9100 9101 9102 ];
  #networking.firewall.allowedUDPPorts = [ 161 5353 ];

}
