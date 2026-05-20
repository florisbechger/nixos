
{ pkgs, config, lib, ... }:

{
  # Assign admin to audio group.
  users.users.${config.users.admin}.extraGroups = [ "audio" ];

  # Install extra utility.
  environment.systemPackages = with pkgs; [
    alsa-utils
  ];

  # Disable pulseaudio.
  services.pulseaudio.enable = false;

  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
  };

  # Save sound card state on shutdown.
  hardware.alsa.enablePersistence = true;

  # Enable RealtimeKit for audio purposes.
  security.rtkit.enable = true;

}
