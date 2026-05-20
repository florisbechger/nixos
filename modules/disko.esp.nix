
{ pkgs, ... }:

{
  # System disk.
  disko.devices = {
    disk = {
      disk0 = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
            };
            ESP = {
              name = "ESP";
              size = "512M";
              type = "EF00"; # for grub ESP
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ]; # may fail: comment out
              };
            };

            # First partition
            root = {
              size = "10%";
              content = {
                name = "root";
                type = "filesystem"; # type "luks" for encrypted partition
                format = "ext4";
                mountpoint = "/";

                # interactive login be sure there is no trailing newline:
                # use: echo -n "passwd" > /tmp/secret.key
                # non-interactive login
                # use: dd if=/dev/urandom bs=1 count=32 | base64 > /tmp/secret.key

                # create additionalKeyFiles is a list of additional key files
                # they will be used to unlock the luks partition
                # create a random key so we can backup it in another place and never lose the access to our data.
                # use: dd if=/dev/urandom of=/tmp/additionalsecret.key bs=4096 count=1
/*
                keyFile = "/tmp/secret.key";
                additionalKeyFiles = [ "/tmp/additionalsecret.key" ];
                allowDiscards = true;
                extraFormatArgs = [ "--type luks1" "--iter-time 1000" ];
*/
              };
            };

            # Second partition
            data = {
              size = "90%";
              content = {
                name = "data";
                type = "filesystem"; # type "luks" for encrypted partition
                format = "ext4";
                mountpoint = "/data";

                # interactive login be sure there is no trailing newline:
                # use: echo -n "passwd" > /tmp/secret.key
                # non-interactive login
                # use: dd if=/dev/urandom bs=1 count=32 | base64 > /tmp/secret.key

                # create additionalKeyFiles is a list of additional key files
                # they will be used to unlock the luks partition
                # create a random key so we can backup it in another place and never lose the access to our data.
                # use: dd if=/dev/urandom of=/tmp/additionalsecret.key bs=4096 count=1
/*
                keyFile = "/tmp/secret.key";
                additionalKeyFiles = [ "/tmp/additionalsecret.key" ];
                allowDiscards = true;
                extraFormatArgs = [ "--type luks1" "--iter-time 1000" ];
*/
              };
            };

            # Swap partition
            encryptedSwap = {
              size = "32*1024";
              content = {
                type = "swap";
                randomEncryption = true;
                priority = 100; # prefer to encrypt as long as we have space for it
              };
            };

/*
            plainSwap = {
              size = "100%";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true; # resume from hiberation from this device
              };
            };
*/

            nodev = {
              "/tmp" = {
                fsType = "tmpfs";
                mountOptions = [ "size=256M" ];
              };
            };

          };
        };
      };
    };
  };
}
