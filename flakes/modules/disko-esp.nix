
{
  disko.devices = {
    disk = {
      disk0 = {
        #device = "/dev/vda"; # First disk on VM, use MBR
        device = "/dev/sda"; # First disk on NUC, use ESP
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              #type = "EF02"; # for grub MBR
            };
            ESP = {
              name = "ESP";
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                #mountOptions = [ "umask=0077" ];
              };
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
