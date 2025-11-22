{ config, pkgs, home, userName,  ... }:

{
  imports = [
    # ./system/homebrew.nix
    ./system/macos.nix
  ];
  nixpkgs.hostPlatform = "aarch64-darwin";
}
