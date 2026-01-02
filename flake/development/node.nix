{ config, lib, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    nodejs
  ];

  # NPM configuration
  home.file.".npmrc".text = ''
    prefix = ${config.home.homeDirectory}/.npm-global
  '';

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];
}
