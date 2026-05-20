
{ ... }:

{
  # disable the OpenSSH daemon.
  services.openssh = {
    enable = false;
    settings.PermitRootLogin = "no";
  };

  # Disable root login.
  #users.users.root.shell = "/sbin/nologin";

  # Initial password for root.
  # Change after deploy!
  users.users.root.initialPassword = "passwd";
}
