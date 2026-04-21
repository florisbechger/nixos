
{ ... }:

  # Define a user account. Don't forget to reset the initial password.
  let
    user = "admin";
  in

{

  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "wheel" ];
    initialPassword = "passwd";
    home  = "/home/${user}";
    createHome = true;
    shell = "/run/current-system/sw/bin/bash";
  };

  # Allow the user to log in as root with a password.
  users.users.root.initialPassword = "passwd";

  # Don't require sudo/root to `reboot` or `poweroff`.
  security.polkit.enable = true;

}
