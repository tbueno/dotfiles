{ config, lib, pkgs, ... }:
{

  # # Raw configuration files
  home.file.".psqlrc".source = ./dotfiles/psqlrc;
  home.file.".gitconfig".source = ./dotfiles/gitconfig;
  home.file.".gitignore".source = ./dotfiles/gitignore;
  home.file.".wezterm.lua".source = ./dotfiles/wezterm.lua;
}
