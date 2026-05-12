
{ pkgs, config, lib, ... }:

{
  # Assign admin to audio group.
  users.users.${config.users.admin}.extraGroups = [ "audio" ];

  environment.systemPackages = with pkgs; [
    alsa-utils
  ];

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = false;
    jack.enable = true;
  };

}
