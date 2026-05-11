{ config, lib, pkgs, home, email,  ... }:
{
  # Raw configuration files
  home.file.".psqlrc".source = ./psqlrc;
}