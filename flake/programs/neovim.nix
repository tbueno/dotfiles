{ config, lib, pkgs, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/dev/dotfiles";
in
{
  xdg = {
    enable = true;
    configFile.nvim.source =
      config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/config/nvim";
  };

}
