{ config, lib, pkgs, ... }:

{
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # home.username = "bueno";
  # home.packages = [ pkgs.httpie ];

  # programs.git = {
  #   enable = true;
  #   userName = "tbueno";
  #   userEmail = "tbueno@gmail.com";
  # };

  targets.darwin.defaults = {
    NSGlobalDomain = {
      KeyRepeat = 2;
      AppleLanguages = ["en"];
      AppleShowAllExtensions = true;
    };
  };
}