
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Firmware updates.
  hardware.enableRedistributableFirmware = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking.
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.enableIPv6  = false;
  boot.kernel.sysctl."net.ipv6.conf.enp86s0.disable_ipv6" = true;
  boot.kernel.sysctl."net.ipv6.conf.wlo1.disable_ipv6" = true;
  boot.kernel.sysctl."net.ipv6.conf.virbr0.disable_ipv6" = true;

#  networking.interfaces.enp86s0.ipv4.addresses = [ {
#    address = "192.168.0.25";
#    prefixLength = 24;
#  } ];

#  networking.interfaces.enp86s0.ipv4.routes = [ {
#    address = "192.168.0.1";
#    prefixLength = 24;
#  } ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  #networking.firewall.allowedUDPPorts = [ 22 ];
  # Or disable the firewall altogether (false):
  networking.firewall.enable = true;
  #networking.nftables.enable = true;
  # This option only works with the iptables based firewall:
  # networking.firewall.extraCommands = "iptables -A INPUT -p icmp -j ACCEPT";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Enable CUPS to print documents.
  #services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #https://nixos.wiki/wiki/JACK
    #jack.enable = true;
  };

  # List services that you want to enable.
  services.fail2ban.enable = false; # https://nixos.wiki/wiki/Fail2ban
  services.flatpak.enable = false; # https://nixos.org/manual/nixos/stable/#module-services-flatpak
  services.fstrim.enable = true;
  services.mpd.enable = false; # https://nixos.wiki/wiki/MPD
  services.nagios.enable = false; # https://nixos.wiki/wiki/Nagios
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  # Automatic Upgrades.
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-23.11;
  system.autoUpgrade.enable = false;
  system.autoUpgrade.allowReboot = false;

  # Automatic Garbage Collection.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Last entries.
  system.copySystemConfiguration = true;
  system.stateVersion = "23.11";

}
