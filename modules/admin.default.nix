
{ pkgs, config, ... }:

{
  # Create identical groupname to user (more secure).
  users.groups.${config.users.admin} = {
    name = "${config.users.admin}";
  };

  # Configure admin.
  users.users.${config.users.admin} = {
    name = "${config.users.admin}";
    group = "${config.users.admin}";
    extraGroups = [ "wheel" "networkmanager" ];
    isNormalUser = true;
    description = "${config.users.admin}";
    initialPassword = "passwd";
    home  = "/home/${config.users.admin}";
    createHome = true;
    shell = "/run/current-system/sw/bin/bash";
    packages = with pkgs; [
    ];
  };

  # Disable Root login.
  #users.users.root.shell = "/sbin/nologin";

  # Allow the user to log in as root with a password.
  #users.users.root.initialPassword = "passwd"; # Change after deploy

  # Don't require sudo/root to `reboot` or `poweroff`.
  security.polkit.enable = true;
}
