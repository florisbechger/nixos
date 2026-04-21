{ config, pkgs, ... }:

{

# Wireless laptop: wlp0s20f3
# NIC laptop: enp0s31f6
# Wireless NUC: ...
# NIC nuc: enp86s0
# NIC VM: enp1s0

  # Enable networking.
  networking.networkmanager = {
    wireless = {
      enable = true;
      networks = [
        {
          ssid = "YOUR_SSID";
          psk = "YOUR_PASSWORD";
        }
      ];
    };
  };

/*
  networking.wireless = {
    enable = true;
    interfaces = [ "wlp0s20f3" ]; # Laptop
    #interfaces = [ "" ]; NUC
  };
*/

}

