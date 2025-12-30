{ config, pkgs, ... }:
{
  imports = [
    ./programs/direnv.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/wezterm.nix
    ./programs/zsh.nix
    ./dotfiles.nix
  ];

  programs.home-manager.enable = true;

  home = {
    sessionPath = [
      "$HOME/dev/dotfiles/bin"
    ];
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
