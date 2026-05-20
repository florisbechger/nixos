
{ pkgs, ... }:

{
  # System disk.
  disko.devices = {
    disk = {
      disk0 = {
        device = "/dev/vda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              type = "EF02"; # for grub MBR
              size = "1M";
              priority = 1;
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                };
              };
            };
          };
        };
      };
  };
}
