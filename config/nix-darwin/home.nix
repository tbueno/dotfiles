{ config, lib, pkgs, home, email,  ... }:
{
  imports = [ ./optibus.nix ];

  home = {
    homeDirectory = "/Users/${home}";
    packages  = with pkgs; [
      alacritty
      bat
      clojure
      colima
      devenv
      direnv
      docker
      docker-compose
      jetbrains-mono
      neovim
      pyenv
      zsh-syntax-highlighting
    ];
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(direnv hook zsh)"
                              '';
  };

  programs.git = {
    enable = true;
    userName = "Thiago Bueno";
    userEmail = email;
  };

  # Raw configuration files
  home.file.".zshrc".source = ../../zshrc;
  home.file.".psqlrc".source = ../../psqlrc;
  home.file.".gitconfig".source = ../../gitconfig;
  home.file.".gitignore_global".source = ../../gitignore;

  targets.darwin.defaults = {
    NSGlobalDomain = {
      KeyRepeat = 2;
      AppleLanguages = ["en"];
      AppleShowAllExtensions = true;
    };
  };
}