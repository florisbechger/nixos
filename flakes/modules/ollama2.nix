
{ config, pkgs, ... }:

{

/*
  systemd.slices."user" = {
    sliceConfig.MemoryMax = "2G";
  };
*/

  environment.systemPackages = with pkgs; [

    ollama     # Ollama server + CLI
    open-webui # browser-based chat UI for Ollama
    oterm      # text-based terminal client for Ollama

  ];

  services.ollama = {
    enable      = true;
    # Listen on all interfaces so other VMs / hosts can reach the API.
    # Change to "127.0.0.1" to restrict to localhost only.
    host        = "0.0.0.0";
    port        = 11434;

    # Optional: preload models, see https://ollama.com/library
    # dolphin-mistral: The uncensored Dolphin model based on Mistral that excels at coding tasks. Updated to version 2.8. (7b)
    # translategemma:4b (A new collection of open translation models built on Gemma 3, helping people communicate across 55 languages)
    # translategemma:12b (A new collection of open translation models built on Gemma 3, helping people communicate across 55 languages)
    #loadModels = [ "dolphin-mistral" ];

    # CPU-only – no CUDA / ROCm acceleration on this VM.
    # Set to "cuda" or "rocm" if you later attach a GPU.
    acceleration = null;

    # Environment tweaks for 4-core / 16 GB:
    #   OLLAMA_NUM_PARALLEL – how many concurrent requests to serve (keep ≤2)
    #   OLLAMA_MAX_LOADED_MODELS – evict models from RAM when idle
    environmentVariables = {
      OLLAMA_NUM_PARALLEL      = "1";
      OLLAMA_MAX_LOADED_MODELS = "3";
      OLLAMA_MAX_VRAM          = "0";        # CPU-only, no VRAM
    };
  };

  systemd.services.ollama.serviceConfig = {
    MemoryMax = "10G";   # headroom for LLM (~5-6GB) + overhead
    CPUQuota  = "500%";  # 5 of 6 cores
  };


  # Uncomment the block below to enable a full web frontend on port 8081.
  # Access it at https://<vm-ip>:8081 after deployment.
  services.open-webui = {
    enable   = true;
    host     = "0.0.0.0";
    port     = 8081;
    # Point the UI at the local Ollama API
    #environment.OLLAMA_BASE_URL = "https://127.0.0.1:11434";
  };

  # Extra security.
  services.open-webui.environment = {
    ANONYMIZED_TELEMETRY = "False";
    DO_NOT_TRACK = "True";
    SCARF_NO_ANALYTICS = "True";
  };


  # Restrict memory usage Open-WebUI.
  systemd.services.open-webui.serviceConfig.MemoryMax = "12G";

  # Firewall settings.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      11434 # Ollama REST API – required
      8081  # Open-WebUI
    ];
  };
}

/*

  # MODEL PULLED ON FIRST BOOT:
  #   mistral  (7 B parameters, ~4 GB download, fits comfortably in 16 GB RAM)
  #   Swap for any tag listed at https://ollama.com/library

  # ── Pull the default model on first boot ──────────────────────────────────
  # A one-shot systemd unit that runs after Ollama is ready and pulls
  # the model if it is not already present in ~/.ollama/models.
  systemd.services.ollama-pull-mistral = {
    description = "Pull mistral model into Ollama on first boot";
    after       = [ "ollama.service" ];
    wants       = [ "ollama.service" ];
    wantedBy    = [ "multi-user.target" ];
    serviceConfig = {
      Type            = "oneshot";
      RemainAfterExit = true;
      # Run as the same user Ollama uses (root by default in the NixOS module)
      ExecStart = "${pkgs.bash}/bin/bash -c '\
        until ${pkgs.curl}/bin/curl -sf http://0.0.0.0:11434/api/tags > /dev/null; do\
          echo \"Waiting for Ollama...\"; sleep 2;\
        done;\
        ${pkgs.ollama}/bin/ollama pull mistral\
      '";
    };
  };

*/
