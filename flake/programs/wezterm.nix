{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      wezterm
    ];
    file."../dotfiles/.wezterm.lua".source = ./wezterm.lua;
  };
}