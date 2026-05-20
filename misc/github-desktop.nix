
{ pkgs, ... }:

{
  # Install packages in system profile.
  environment.systemPackages = with pkgs; [
    github-desktop
  ];
}
