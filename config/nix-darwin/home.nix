{ config, lib, pkgs, home, email,  ... }:
{
  home = {
    homeDirectory = "/Users/${home}";
    stateVersion = "24.05";
  };

   imports = [
    ./programs/neovim.nix
    ./programs/zsh.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Thiago Bueno";
    userEmail = email;
  };

  # NPM configuration
  home.file.".npmrc".text = ''
    prefix = ${config.home.homeDirectory}/.npm-global
  '';

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  # Raw configuration files
  home.file.".psqlrc".source = ../../psqlrc;
  home.file.".gitconfig".source = ../../gitconfig;
  home.file.".gitignore_global".source = ../../gitignore;
  home.file.".wezterm.lua".source = ../../wezterm.lua;

  targets.darwin.defaults = {
    NSGlobalDomain = {
      KeyRepeat = 2;
      AppleLanguages = ["en"];
      AppleShowAllExtensions = true;
    };
  };
}