{ config, lib, pkgs, home, ... }:

{
  programs.zsh = {
    sessionVariables = {
      EDITOR = "nvim";
    };

    shellAliases = {
      cb = "git branch --show-current";
      k = "kubectl";
      ls = "ls -la --color";
      reload = "exec zsh";
      cat = "bat";
    };

    oh-my-zsh = {
      enable = true;
      custom = "$HOME/dev/dotfiles/oh-my-zsh/custom";

      plugins = [
        "1password"
        "direnv"
        "git"
        # "pyenv"
        "zsh-autosuggestions"
      ];

      theme = "robbyrussell";
    };
  };
}
