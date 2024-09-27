{ config, lib, pkgs, home, email,  ... }:

{
  home = {
    homeDirectory = "/Users/${home}";
    packages  = with pkgs; [
      alacritty
      bat
      clojure
      colima
      docker
      docker-compose
      neovim
      pyenv
      zsh-syntax-highlighting
    ];
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # programs.zsh.enable = true;

  programs.git = {
    enable = true;
    userName = "Thiago Bueno";
    userEmail = email;
  };

  targets.darwin.defaults = {
    NSGlobalDomain = {
      KeyRepeat = 2;
      AppleLanguages = ["en"];
      AppleShowAllExtensions = true;
    };
  };
}