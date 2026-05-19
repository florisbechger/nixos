
{ ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  # Disable root login.
  #users.users.root.shell = "/sbin/nologin";

  # Initial password for root.
  # Change after deploy!
  users.users.root.initialPassword = "passwd"; 

}
