{ config, lib, pkgs, home, ... }:

{
  programs.zsh = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
    };

    initExtra = ''
      claude-work() {
        open -n -a "Claude" --args --user-data-dir="$HOME/Library/Application Support/Claude"
      }

      claude-work-2() {
        open -n -a "Claude" --args --user-data-dir="$HOME/Library/Application Support/Claude-Work"
      }
    '';

    shellAliases = {
      cb = "git branch --show-current";
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
        "zsh-autosuggestions"
      ];

      theme = "robbyrussell";
    };
  };
}
