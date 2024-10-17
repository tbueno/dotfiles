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
      devbox
      devenv
      direnv
      docker
      docker-compose
      jetbrains-mono
      neovim
      pyenv
      zsh-syntax-highlighting
    ];
    sessionVariables = {
      PYENV_ROOT = "$HOME/.pyenv";

    };
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(pyenv virtualenv-init -)"
      eval "$(direnv hook zsh)"
                              '';

    sessionVariables = {
      EDITOR = "nvim";
    };
    shellAliases = {
      ls = "ls -la";
      reload = "source ~/.zshrc";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

   programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      colors.draw_bold_text_with_bright_colors = true;
      env.TERM = "xterm-256color";
      font = {
        size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
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