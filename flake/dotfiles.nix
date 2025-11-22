{ config, lib, pkgs, home, email,  ... }:
{
  # Raw configuration files
  home.file.".psqlrc".source = ./../psqlrc;
  home.file.".gitconfig".source = ./../gitconfig;
  home.file.".gitignore_global".source = ./../gitignore;
  home.file.".wezterm.lua".source = ./../wezterm.lua;
}