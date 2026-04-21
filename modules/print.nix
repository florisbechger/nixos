
{ pkgs, ... }:

{

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.browsing = true;
  services.printing.drivers = [ pkgs.canon-cups-ufr2 ];
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.workstation = true;
  services.avahi.publish.addresses = true;
  services.avahi.openFirewall = true;

}
