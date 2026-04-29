
{
  disko.devices = {
    disk = {
      disk0 = {
        device = "/dev/vda"; # First disk on VM, use MBR
        #device = "/dev/sda"; # First disk on NUC, use ESP
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              type = "EF02"; # for grub MBR
              size = "1M";
              priority = 1; # Needs to be first partition
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
