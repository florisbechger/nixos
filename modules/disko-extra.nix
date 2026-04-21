
{
  disko.devices = {

    disk = {

      disk1 = {
        device = "/dev/nvme0n1"; # Second disk on NUC
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            data = {
              start = "1M";
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/data";

                };
              };
            };
          };
        };
      };

  };
}
