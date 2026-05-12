
{ pkgs, ... }:

let
  service = "flatpak";
in

{
  # Enable Flatpaks.
  services.${service}.enable = true;
}

  # flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
