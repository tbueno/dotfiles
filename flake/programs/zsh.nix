{ config, lib, pkgs, home, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      ASDF_DATA_DIR = "$HOME/.asdf";
    };

    initContent = ''
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
      todo = "zellij run --floating --close-on-exit --name todo --width 70% --height 70% -x 15% -y 15% -- tuxedo ~/dev/todo.txt";
      lg = "zellij run --floating --close-on-exit --name lg --width 70% --height 70% -x 15% -y 15% -- lazygit";
    };

    oh-my-zsh = {
      enable = true;
      custom = "$HOME/dev/dotfiles/oh-my-zsh/custom";

      plugins = [
        "1password"
        "direnv"
        "git"
      ];

      theme = "robbyrussell";
    };
  };
}
