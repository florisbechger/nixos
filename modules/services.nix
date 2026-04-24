
{ pkgs, ... }:

{

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = false;
    settings.PermitRootLogin = "no";
  };

  # List Services enabled.
  services.thermald.enable = true; # Power settings
  services.fstrim.enable = true; # SSD disk TRIM support
  #services.fail2ban.enable = true; # https://nixos.wiki/wiki/Fail2ban
  #services.nagios.enable = true; # https://nixos.wiki/wiki/Nagios

  # List Services disabled.
  services.xserver.excludePackages = [ pkgs.xterm ];

}
