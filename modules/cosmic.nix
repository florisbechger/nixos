
{ pkgs, ... }:

{
  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;
  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  # Automatic login
  #services.displayManager.autoLogin = {
    #enable = true;
    #user = "yourUserName";
  #};

  # Optimization
  services.system76-scheduler.enable = true;

  # Install Firefox
  #programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Exclude packages
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-store
  ];

  # Clipboard
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

}
