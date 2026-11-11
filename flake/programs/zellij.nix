{ config, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/dev/dotfiles";
in
{
  xdg.configFile.zellij.source =
    config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/config/zellij";
}
