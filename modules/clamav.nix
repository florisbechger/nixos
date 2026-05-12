
{ pkgs, ... }:

  let
    service = "clamav";
  in

{
  # Enable ClamAV virusscanner.
  services.${service} = {
    daemon.enable = true;
    updater.enable = true;
  };

}
