{ config, lib, pkgs, home, email,  ... }:
{
  # Raw configuration files
  home.file.".psqlrc".source = ./psqlrc;
  home.file.".gitconfig-personal".source = ./gitconfig-personal;
}