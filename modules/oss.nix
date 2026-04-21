
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oss
  ];

  boot.kernelModules = [ "oss" ];

  hardware.alsa.enableOSSEmulation = false;
  services.pulseaudio.enable = false;

  systemd.services.oss = {
    description = "Open Soud System";
    wantedBy = [ "multi-user.target" ];
    after = [ "sound.target" ];
#    serviceConfig = {
#      Type = "forking";
#      ExecStart = "${pkgs.oss}/bin/soundon";
#      ExecStop = "${pkgs.oss}/bin/soundoff";
#      RemainAfterExit = true;
#    };
  };

}
