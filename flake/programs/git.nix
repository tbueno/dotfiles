{ config, lib, pkgs, email, ... }:

{
  programs.git = {
    enable = true;
    userName = "Thiago Bueno";
    userEmail = email;

    aliases = {
      st = "status";
      pom = "push origin master";
      pr = "pull --rebase";
      ca = "commit --amend --no-edit";
      lp = "log -p";
      d = "diff";
      ds = "diff --staged";
      l = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      lg = "log --graph --oneline --decorate --color --all";
      b = "branch";
      cp = "cherry-pick";
    };

    extraConfig = {
      branch.sort = "-committerdate";

      color = {
        branch = "auto";
        status = "auto";
      };

      "color \"branch\"" = {
        current = "yellow reverse";
        local = "yellow";
        remote = "green";
      };

      "color \"diff\"" = {
        meta = "yellow bold";
        frag = "magenta bold";
        old = "red bold";
        new = "green bold";
      };

      "color \"status\"" = {
        added = "yellow";
        changed = "green";
        untracked = "cyan";
      };

      column.ui = "auto";

      credential.helper = "osxkeychain";

      commit.gpgsign = false;

      core = {
        editor = "nvim";
        excludesFile = "~/.gitignore_global";
      };

      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
      };

      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };

      help.autocorrect = "prompt";

      hub.protocol = "https";

      init = {
        defaultBranch = "main";
        autoSetupRemote = true;
      };

      merge.conflictStyle = "zdiff3";

      push.default = "simple";

      rerere = {
        enabled = true;
        autoupdate = true;
      };
    };


  };
}