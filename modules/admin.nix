
{ lib, ... }:

let
  cfg = lib.mkOption {
    type = lib.types.str;
    default = "admin";
    description = "admin";
  };
in

{

  imports =
    [
      ./admin.default.nix
    ];

  options.users.admin = cfg;

}
