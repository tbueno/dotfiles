{ config, pkgs, ... }:
{
  imports = [
    ./programs/neovim.nix
    ./programs/wezterm.nix
    ./programs/zsh.nix
    ./dotfiles/dotfiles.nix
  ];

  programs.home-manager.enable = true;

  home = {
    sessionPath = [
      "$HOME/dev/dotfiles/bin"
    ];
  };
}
