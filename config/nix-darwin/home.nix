{ config, lib, pkgs, home, email,  ... }:
{
  home = {
    homeDirectory = "/Users/${home}";
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    initExtra = ''

                              '';

    sessionVariables = {
      EDITOR = "nvim";
    };
    shellAliases = {
      cb = "git branch --show-current";
      ls = "ls -la --color";
      reload = "exec zsh";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
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

   oh-my-zsh = {
    enable = true;
    custom = "~/dev/dotfiles/oh-my-zsh/custom";

    plugins = [
      "direnv"
      "git"
      "zsh-autosuggestions"
      "zsh-syntax-highlighting"
    ];

    theme = "robbyrussell";
  };

  # Raw configuration files
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