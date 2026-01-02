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
    packages = with pkgs; [
      bat
      clojure
      colima
      devbox
      docker
      git
      go
      home-manager
      jetbrains-mono
      neovim
      nodejs
      zsh-syntax-highlighting
      zsh-autosuggestions
    ];
  };
}
