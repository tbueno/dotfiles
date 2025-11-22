{ config, lib, pkgs, ... }:

{
  xdg = {
    enable = true;
    configFile.nvim.source = "${home}/dev/dotfiles/config/nvim";
  };

}
