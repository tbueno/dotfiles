{ config, lib, pkgs, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/dev/dotfiles";
in
{
  home = {
    packages = with pkgs; [
      wezterm
    ];
    file.".wezterm.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/config/wezterm/wezterm.lua";
  };
}
