{ config, lib, pkgs, ... }:

{
  xdg = {
    enable = true;
    configFile.nvim.source = ~/dev/dotfiles/config/nvim;
  };

}
