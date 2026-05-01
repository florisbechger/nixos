
{ ... }:

  # Define a user account. Don't forget to reset the initial password.
  let
    user = "floris";
  in

{

  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "passwd";
    home  = "/home/${user}";
    createHome = true;
    shell = "/run/current-system/sw/bin/bash";
    #packages = with pkgs; [
    # some package
    #];

  };

  # Allow the user to log in as root with a password.
  users.users.root.initialPassword = "passwd";

  # Don't require sudo/root to `reboot` or `poweroff`.
  security.polkit.enable = true;

}
