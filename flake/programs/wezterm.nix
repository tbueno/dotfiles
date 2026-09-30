{ config, lib, pkgs, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/dev/dotfiles";
in
{
  home = {
    packages = with pkgs; [
      wezterm
    ];
    file.".wezterm.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/config/wezterm/wezterm.lua";
  };

  # Retitles the tab holding the current pane, which wezterm identifies through
  # $WEZTERM_PANE. Merges with the aliases declared in zsh.nix.
  programs.zsh.shellAliases.rename-tab = "wezterm cli set-tab-title";
}
