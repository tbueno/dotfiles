{ config, lib, pkgs, home, ... }:

{
  xdg = {
    enable = true;
    configFile.nvim.source = ~/dev/dotfiles/config/nvim;
  };

}
