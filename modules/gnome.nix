
{ pkgs, ... }:

{

  #Enable the X11 windowing system.
  services.xserver.enable = false;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  gnome-tweaks
  gnomeExtensions.ip-finder
  gnomeExtensions.transparent-window-moving
  gnomeExtensions.transparent-top-bar
  ];

  # Exclude packages.
  environment.gnome.excludePackages = with pkgs; [
  epiphany
  geary
  gnome-calendar
  gnome-contacts
  gnome-maps
  gnome-software
  gnome-weather
  gnome-tour
  evolution
  evolution-data-server
  ];

}
