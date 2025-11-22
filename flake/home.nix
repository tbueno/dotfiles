{ config, pkgs, ... }:

{
  imports = [
    ./programs/neovim.nix
    ./programs/zsh.nix
    ./dotfiles.nix
  ];

  # Add neovim to home packages
  home.packages = with pkgs; [
    bat
    clojure
    jetbrains-mono
    neovim
    ruby
    wezterm
    zsh-syntax-highlighting
    zsh-autosuggestions
  ];
}
