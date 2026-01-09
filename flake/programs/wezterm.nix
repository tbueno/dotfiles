{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      wezterm
    ];
    file.".wezterm.lua".source = ../dotfiles/wezterm.lua;
  };
}