{ config, pkgs, user, home, usersPath, ... }:

{
  # Enable sudo to be unlocked with touch ID
  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    NSGlobalDomain = {
      AppleShowAllExtensions = true;

      KeyRepeat = 2;
      InitialKeyRepeat = 15;
    };

    dock = {
      autohide = true;
      magnification = true;
      largesize = 64;
      tilesize = 32;
    };

    screencapture.location = "~/Downloads/screenshots";
  };
}