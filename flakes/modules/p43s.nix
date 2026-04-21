{ config, lib, ... }:

{

  # Fingerprint reader: login and unlock with fingerprint (if you add one with `fprintd-enroll`)
  #services.fprintd.enable = true;

  hardware = {
    graphics.enable = lib.mkDefault true;

    #trackpoint.enable = lib.mkDefault true;
    #trackpoint.emulateWheel = lib.mkDefault config.hardware.trackpoint.enable;

    nvidia = {
      prime = {
        intelBusId = lib.mkDefault "PCI:0:2:0";
        nvidiaBusId = lib.mkDefault "PCI:60:0:0";
      };
      powerManagement.enable = lib.mkDefault config.hardware.nvidia.prime.sync.enable;
    };
  };
}
