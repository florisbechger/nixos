
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
    # dolphin-mistral: The uncensored Dolphin model based on Mistral that excels at coding tasks. Updated to version 2.8. (7b)
    # translategemma:4b (A new collection of open translation models built on Gemma 3, helping people communicate across 55 languages)
    # translategemma:12b (A new collection of open translation models built on Gemma 3, helping people communicate across 55 languages)
    loadModels = [ "dolphin-mistral" ];
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

