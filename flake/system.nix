{ config, pkgs, user, ... }:

{
  imports = [
    ./system/macos.nix
    ./system/homebrew.nix
  ];

  nix = {
    enable = false;
    settings.experimental-features = "nix-command flakes";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 5;

}