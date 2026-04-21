{ config, pkgs, ... }:

{
  # Disable PulseAudio
  services.pulseaudio.enable = false;

  # Enable JACK for hi-res audio
  services.jack = {
    jackd.enable = true;
    # Use ALSA backend
    alsa.enable = true;
  };

  # Enable PipeWire with JACK support
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = false;
    
    # Configure JACK support
    #jack.enable = true;
    
    # Low-latency configuration for hi-res audio
    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock.rate = 48000;
        default.clock.quantum = 1024;
        default.clock.min-quantum = 512;
        default.clock.max-quantum = 2048;
      };
    };
  };

  # Allow realtime priority for audio group
  security.rtkit.enable = true;

  # Add user floris to audio and jackaudio groups
  users.users.floris = {
    isNormalUser = true;
    extraGroups = [ "audio" "jackaudio" ];
  };

  # Install useful JACK tools
  environment.systemPackages = with pkgs; [
    qjackctl  # JACK control GUI
    jack2     # JACK audio connection kit
    alsa-utils # ALSA utilities
  ];
}
