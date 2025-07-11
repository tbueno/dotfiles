{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      wezterm
    ];

  };
}