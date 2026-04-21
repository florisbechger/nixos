
# https://wiki.nixos.org/wiki/Ollama

{ pkgs, ... }:

# ollama-cpu: disable GPU, only use CPU
# ollama-rocm: supported by most modern AMD GPUs
# ollama-cuda: supported by most modern NVIDIA GPUs
# ollama-vulkan: supported by most modern GPUs on Linux

{

  environment.systemPackages = with pkgs; [
    oterm
  ];

  services.ollama = {
    enable = true;
    package = pkgs.ollama-cpu;
    # Optional: preload models, see https://ollama.com/library
    loadModels = [ "" ];
  };

  services.open-webui = {
    enable = true;
    port = 8081;
  };

  services.open-webui.environment = {
    ANONYMIZED_TELEMETRY = "False";
    DO_NOT_TRACK = "True";
    SCARF_NO_ANALYTICS = "True";
  };

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 8081 ];

}

# journalctl -u ollama.service
# systemctl status ollama.service
# systemctl status open-webui.service

# oterm

