{ config, pkgs, user, home, usersPath, ... }:

{
  homebrew = {
      enable = true;
      onActivation = {
        autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
        upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
        # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
        cleanup = "zap";
      };

      brews = [
        "pure"
      ];

      casks = [
        "1password"
        "arc"
        "chatgpt"
        "dropbox"
        "firefox"
        "iterm2"
        "obsidian"
        "raycast"
        "visual-studio-code"
        "wezterm"
      ];
    };
}