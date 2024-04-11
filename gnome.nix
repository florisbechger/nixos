
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

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

  # Exclude Gnome items:
  environment.gnome.excludePackages = with pkgs; [
    gnome.geary
    gnome.gnome-contacts
    gnome.gnome-characters
    gnome.gnome-maps
    gnome.gnome-software
    gnome.gnome-weather
    gnome.gnome-calendar
    gnome.seahorse
    gnome-tour
    gnome.yelp
    epiphany
    evolutionWithPlugins
    evolution-data-server
  ];

  # List services that you want to disable:
  services.xserver.excludePackages = [ pkgs.xterm ];

