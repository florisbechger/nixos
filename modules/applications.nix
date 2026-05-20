
{ pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Install packages in system profile.
  environment.systemPackages = with pkgs; [
    clamtk
    librewolf
    tidal-hifi
  ];
}
