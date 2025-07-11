{ config, lib, pkgs, ... }:

{
  programs.direnv.enable = true;
  home = {
    packages = with pkgs; [
      direnv
    ];
  };
}