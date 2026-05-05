
{ ... }:

  let
    user = "floris";
    admin = "admin";
    service = "qemu";
  in

{

  # Create groups
  users.groups.${user} = {};
  users.groups.${admin} = {};
  users.groups.${service} = {};

  # Create user
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    group = "${user}";
    extraGroups = [ "wheel" "networkmanager" "audio" "libvirtd" "podman" ];
    initialPassword = "passwd";
    home  = "/home/${user}";
    createHome = true;
    shell = "/run/current-system/sw/bin/bash";
    #packages = with pkgs; [
    # some package
    #];
  };

/*
  # Create user
  users.users.${admin} = {
    isNormalUser = true;
    description = "${admin}";
    group = "${admin}";
    extraGroups = [ "wheel" "networkmanager" "audio" "libvirtd" "podman" ];
    initialPassword = "passwd";
    home  = "/home/${admin}";
    createHome = false;
    shell = "/run/current-system/sw/bin/bash";
    #packages = with pkgs; [
    # some package
    #];
  };
*/

  # Create user
  users.users.${service} = {
    isSystemUser = true;
    description = "${service}";
    group = "${service}";
    shell = "/usr/bin/nologin"; # No shell
    createHome = false; # No homedirectory
    password = "!"; # No password
    #packages = with pkgs; [
    # some package
    #];
  };

  # Allow the user to log in as root with a password.
  users.users.root.initialPassword = "passwd"; # Change after deploy

  # Don't require sudo/root to `reboot` or `poweroff`.
  security.polkit.enable = true;

}
